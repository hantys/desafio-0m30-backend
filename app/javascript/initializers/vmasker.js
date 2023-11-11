import compose from "lodash/fp/compose";
import VMasker from "vanilla-masker";
import { domReady } from "../utils";

const inputHandler = (masks, max, event) => {
  let c = event.target;
  let v = c.value.replace(/\D/g, "");
  let m = c.value.length > max ? 1 : 0;
  VMasker(c).unMask();
  VMasker(c).maskPattern(masks[m]);
  c.value = VMasker.toPattern(v, masks[m]);
};

export const vmaskerDdds = () => {
  document.addEventListener("turbo:load", () => {
    const ddds = Array.from(document.querySelectorAll(".ddd"));

    if (ddds) {
      ddds.map((ddd) => {
        VMasker(ddd).maskPattern("99");
      });
    }
  });
};

export const vmaskerPhoneNums = () => {
  document.addEventListener("turbo:load", () => {
    const tels = Array.from(document.querySelectorAll(".phoneNumber"));

    if (tels) {
      tels.map((tel) => {
        let telMask = ["9999-9999", "99999-9999"];
        if (tel.value.length === 9) {
          VMasker(tel).maskPattern(telMask[0]);
        } else {
          VMasker(tel).maskPattern(telMask[1]);
        }
        tel.addEventListener(
          "input",
          inputHandler.bind(undefined, telMask, 9),
          false
        );
      });
    }
  });
};

const vmaskerPhones = () => {
  document.addEventListener("turbo:load", () => {
    const tels = Array.from(document.querySelectorAll(".phoneFull"));

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
  });
};

const vmaskerDocs = () => {
  document.addEventListener("turbo:load", () => {
    const docs = Array.from(document.querySelectorAll(".doc"));

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
  });
};

const vmaskerPlates = () => {
  document.addEventListener("turbo:load", () => {
    const plates = Array.from(document.querySelectorAll(".fieldLicensePlate"));

    if (plates) {
      plates.map((plate) => {
        VMasker(plate).maskPattern("AAA9SS9");
      });
    }
  });
};

const vmaskerCEP = () => {
  document.addEventListener("turbo:load", () => {
    const ceps = Array.from(document.querySelectorAll(".cep"));

    if (ceps) {
      ceps.map((cep) => {
        VMasker(cep).maskPattern("99999-999");
      });
    }
  });
};

const vmaskerCPF = () => {
  document.addEventListener("turbo:load", () => {
    const cpfs = Array.from(document.querySelectorAll(".cpf"));

    if (cpfs) {
      cpfs.map((cpf) => {
        VMasker(cpf).maskPattern("999.999.999-99");
      });
    }
  });
};

const vmaskerCard = () => {
  document.addEventListener("turbo:load", () => {
    const cards = Array.from(document.querySelectorAll(".credit-card"));

    if (cards) {
      cards.map((card) => {
        VMasker(card).maskPattern("9999 9999 9999 9999");
      });
    }
  });
};

const vmaskerCNPJ = () => {
  document.addEventListener("turbo:load", () => {
    const cnpjs = Array.from(document.querySelectorAll(".cnpj"));

    if (cnpjs) {
      cnpjs.map((cnpj) => {
        VMasker(cnpj).maskPattern("99.999.999/9999-99");
      });
    }
  });
};

const vmaskerBirthday = () => {
  document.addEventListener("turbo:load", () => {
    const birthdays = Array.from(document.querySelectorAll(".birthday"));

    if (birthdays) {
      birthdays.map((birthday) => {
        VMasker(birthday).maskPattern("99/99");
      });
    }
  });
};

const vmaskerCreditCardValidate = () => {
  document.addEventListener("turbo:load", () => {
    const validates = Array.from(
      document.querySelectorAll(".credit-card-validate")
    );

    if (validates) {
      validates.map((validate) => {
        VMasker(validate).maskPattern("99/99");
      });
    }
  });
};

const vmaskerCreditCardSecurityCode = () => {
  document.addEventListener("turbo:load", () => {
    const security_codes = Array.from(
      document.querySelectorAll(".credit-card-security-code")
    );

    if (security_codes) {
      security_codes.map((security_code) => {
        VMasker(security_code).maskPattern("999");
      });
    }
  });
};

export const refreshVMasker = compose(
  vmaskerPhones,
  vmaskerDocs,
  vmaskerPlates,
  vmaskerDdds,
  vmaskerPhoneNums,
  vmaskerCEP,
  vmaskerCPF,
  vmaskerCard,
  vmaskerCreditCardSecurityCode,
  vmaskerCreditCardValidate,
  vmaskerCNPJ,
  vmaskerBirthday
);

export default domReady(
  compose(
    vmaskerPhones,
    vmaskerDocs,
    vmaskerPlates,
    vmaskerDdds,
    vmaskerPhoneNums,
    vmaskerCEP,
    vmaskerCPF,
    vmaskerCard,
    vmaskerCreditCardSecurityCode,
    vmaskerCreditCardValidate,
    vmaskerCNPJ,
    vmaskerBirthday
  )
);
