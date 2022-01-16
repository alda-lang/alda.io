if (!WebAssembly.instantiateStreaming) { // polyfill
  WebAssembly.instantiateStreaming = async (resp, importObject) => {
    const source = await (await resp).arrayBuffer();
    return await WebAssembly.instantiate(source, importObject);
  };
}

const go = new Go();
WebAssembly.instantiateStreaming(
  fetch("assets/wasm/alda.wasm"), go.importObject
).then((result) => {
  go.run(result.instance)
  console.info(`alda.wasm ${Alda.VERSION} loaded`)
}).catch((err) => {
  console.error(err);
});
