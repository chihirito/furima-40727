const pay = () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    const calculatePrices = () => {
      const inputValue = priceInput.value;
      const price = parseFloat(inputValue);

      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");

      if (isNaN(price)) {
        addTaxDom.innerHTML = '';
        profitDom.innerHTML = '';
      } else {
        addTaxDom.innerHTML = Math.floor(price * 0.1);
        profitDom.innerHTML = (price - Math.floor(price * 0.1));
      }
    };

    // ページが読み込まれた時点で計算を実行
    calculatePrices();

    // inputイベントリスナーを設定
    priceInput.addEventListener("input", calculatePrices);
  }
};

// Turboのイベントリスナーを設定
window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
