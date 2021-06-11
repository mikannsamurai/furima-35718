const pay = () => {
  Payjp.setPublicKey("pk_test_d8dd6bf4599c6ce5bf0ba369");
  const form = document.getElementById("charge-form");
  form.addEventListener('submit', (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buyer_product_purchase_management[number]"),
      exp_month: formData.get("buyer_product_purchase_management[exp_month]"),
      exp_year: `20${formData.get("buyer_product_purchase_management[exp_year]")}`,
      cvc:     formData.get("buyer_product_purchase_management[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200){
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);