# We don't want to store alda.wasm in this repo because:
#
# 1. alda.wasm is about 4 MB in size, which is a little large to be checking
#    into source control.
#
# 2. We don't want to be in the business of updating the copy of alda.wasm kept
#    in this repo every time there is a new release of Alda.
#
# So, the code below runs as a hook when Jekyll builds the site. It fetches the
# latest release version of alda.wasm and includes it in the assets directory.

require 'fileutils'
require 'json'
require 'net/http'
require 'tempfile'

Jekyll::Hooks.register :site, :after_init do |site|
  puts "Fetching release information from the Alda API..."

  res = Net::HTTP.get_response(URI("https://api.alda.io/releases/latest"))

  if res.code != "200"
    puts "WARN: Unexpected #{res.code} response from Alda API"
    puts "WARN: #{res.body}"
    next
  end

  begin
    json = JSON.parse(res.body)
  rescue JSON::ParserError => e
    puts "WARN: Unexpected failure to parse Alda API response JSON"
    puts "WARN: #{e}"
    puts "WARN: #{res.body}"
    next
  end

  releases = json["releases"]
  unless releases
    puts "WARN: Unexpected Alda API response"
    puts "WARN: #{res.body}"
    next
  end

  release = releases[0]
  unless release
    puts "WARN: Unexpected Alda API response"
    puts "WARN: #{res.body}"
    next
  end

  assets = release["assets"]
  unless assets
    puts "WARN: Unexpected Alda API response"
    puts "WARN: #{res.body}"
    next
  end

  jsWasmAssets = assets["js-wasm"]
  unless jsWasmAssets
    puts "WARN: Unexpected Alda API response"
    puts "WARN: #{res.body}"
    next
  end

  wasmAsset = jsWasmAssets.filter {|asset| asset["type"] == "wasm"}[0]
  unless wasmAsset
    puts "WARN: Unexpected Alda API response"
    puts "WARN: #{res.body}"
    next
  end

  puts "Fetching alda.wasm..."

  aldaWasm = Tempfile.new("alda.wasm")
  begin
    res = Net::HTTP.get_response(URI(wasmAsset["url"]))

    if res.code != "200"
      puts "WARN: Unexpected #{res.code} response for alda.wasm"
      puts "WARN: #{res.body}"
      next
    end

    aldaWasm.write(res.body)

    FileUtils.mkdir_p("assets/wasm")
    FileUtils.mv(aldaWasm, "assets/wasm/alda.wasm")
  ensure
    aldaWasm.close
    aldaWasm.unlink
  end
end


