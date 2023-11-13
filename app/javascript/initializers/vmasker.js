import VMasker from "vanilla-masker";

const applyMasks = () => {
  const tels = Array.from(document.querySelectorAll(".phoneFull"));
  const ceps = Array.from(document.querySelectorAll(".cep"));
  const docs = Array.from(document.querySelectorAll(".doc"));
  const cpfs = Array.from(document.querySelectorAll(".cpf"));
  const cnss = Array.from(document.querySelectorAll(".cns"));

  const inputHandler = (masks, max, event) => {
    let c = event.target;
    let v = c.value.replace(/\D/g, "");
    let m = c.value.length > max ? 1 : 0;
    VMasker(c).unMask();
    VMasker(c).maskPattern(masks[m]);
    c.value = VMasker.toPattern(v, masks[m]);
  };

  if (tels) {
    tels.map((tel) => {
      let telMask = ["(99) 9999-9999", "(99) 99999-9999"];

      if (tel.value.length === 14) {
        VMasker(tel).maskPattern(telMask[0]);
      } else {
        VMasker(tel).maskPattern(telMask[1]);
      }

      tel.addEventListener(
        "input",
        inputHandler.bind(undefined, telMask, 14),
        false
      );
    });
  }

  if (docs) {
    docs.map((doc) => {
      let docMask = ["999.999.999-999", "99.999.999/9999-99"];
      VMasker(doc).maskPattern(docMask[0]);
      doc.addEventListener(
        "input",
        inputHandler.bind(undefined, docMask, 14),
        false
      );
    });
  }

  if (ceps) {
    ceps.map((cep) => {
      VMasker(cep).maskPattern("99999-999");
    });
  }

  if (cpfs) {
    cpfs.map((cpf) => {
      VMasker(cpf).maskPattern("999.999.999-99");
    });
  }

  if (cnss) {
    cnss.map((cns) => {
      VMasker(cns).maskPattern("999999999999999");
    });
  }

};

document.addEventListener("turbo:load", applyMasks);
document.addEventListener("turbo:render", applyMasks);
