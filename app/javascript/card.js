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
        const renderDom = document.getElementById("charge-form");
        const token0bj = `<input value = ${token} name = 'token' type = 'hidden'>`;
        renderDom.insertAdjacentHTML('beforeend',token0bj );
        debugger;
      }
    });
  });
};

window.addEventListener("load", pay);