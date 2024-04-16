//Takes in a block header and verifies its validity

const crypto = require("crypto");

function verify(header) {
  const { version, prevHash, merkleRoot, timestamp, target, nonce } = header;

  //concatenate
  const headerString = `${version}${prevHash}${merkleRoot}${timestamp}${target}${nonce}`;

  //double SHA-256
  const headerHash = crypto
    .createHash("sha256")
    .update(headerString)
    .digest("hex");
  const headerHashHash = crypto
    .createHash("sha256")
    .update(headerHash)
    .digest("hex");

  //convert target to a number
  const tar = BigInt("0x" + target);

  //verify
  const headerHashHashInt = BigInt("0x" + headerHashHash);
  return headerHashHash <= tar;
}
