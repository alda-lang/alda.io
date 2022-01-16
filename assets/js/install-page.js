const downloadDiv = document.getElementById("download-alda");
const installDiv = document.getElementById("install-alda");

const windowsPathInfoUrl = "https://medium.com/@kevinmarkvi/how-to-add-executables-to-your-path-in-windows-5ffa4ce61a53";

const linuxPathInfoUrl = "https://linuxize.com/post/how-to-add-directory-to-path-in-linux/";

function element(type, {innerHTML, innerText} = {}) {
  const element = document.createElement(type);

  if (innerHTML) {
    element.innerHTML = innerHTML;
  }

  if (innerText) {
    element.innerText = innerText;
  }

  return element;
}

downloadDiv.appendChild(element("em", {innerHTML: "Loading..."}));

function bailOut() {
  downloadDiv.innerHTML = `
  <p>
    <strong>Oops... something went wrong.</strong>

    Please
    <a href="mailto:dave.yarwood@gmail.com?subject=Alda+install+page">
      send Dave an email
    </a>

    to give him a heads up!
  </p>
  `;
}

function unexpectedResponse(response) {
  console.error("Unexpected response:", response);
  bailOut();
}

const req = new XMLHttpRequest();

req.addEventListener("load", function() {
  let res;

  try {
    res = JSON.parse(this.responseText);
  } catch (error) {
    console.error(error);
    return bailOut();
  }

  if (!res.releases || res.releases.length != 1) {
    return unexpectedResponse(res);
  }

  const release = res.releases[0];

  if (!release.version || !release.date || !release.assets) {
    return unexpectedResponse(res);
  }

  document
    .getElementById("step-2-download-alda")
    .innerText =
    `Step 2: Download Alda ${release.version} (${release.date})`;

  downloadDiv.innerHTML = "";
  downloadDiv.appendChild(
    element(
      "p",
      {
        innerText: "Download the Alda executables below for your platform:"
      }
    )
  );

  const table = element("table");

  [
    {label: "Mac (64-bit)",     key: "darwin-amd64"},
    {label: "Windows (64-bit)", key: "windows-amd64"},
    {label: "Windows (32-bit)", key: "windows-386"},
    {label: "Linux (64-bit)",   key: "linux-amd64"},
    {label: "Linux (32-bit)",   key: "linux-386"}
  ].forEach(({label, key}) => {
    const assets = release.assets[key];
    if (!assets) return;

    const assetsHTML =
      assets.map(
        ({name, url}) => `<a href="${url}">${name}</a>`
      ).join(" + ");

    table.appendChild(
      element(
        "tr",
        {
          innerHTML: `
          <td><strong>${label}:</strong></td>
          <td>${assetsHTML}</td>
          `
        }
      )
    );
  });

  downloadDiv.appendChild(table);

  installDiv.innerHTML = `
  <p>
    On Mac and Linux, first run <code>chmod +x
    ~/Downloads/{alda,alda-player}</code> (replace <code>~/Downloads</code> with
    wherever you downloaded the files) to ensure that the files are executable.
  </p>

  <p>
    On Windows, the <code>.exe</code> files are already executable, but you may
    need to right-click the files and click "unblock" in the file properties.
  </p>

  <p>
    Next, make the executables available to run from the command line by placing
    them in a directory on your PATH.

    <em>
      (If you don't know what your PATH is, here is some information about PATH
      for
      <a href="${windowsPathInfoUrl}">Windows</a> or
      <a href="${linuxPathInfoUrl}">Mac/Linux</a> users).
    </em>
  </p>
  `
})

req.open("GET", "https://api.alda.io/releases/latest");
req.send();
