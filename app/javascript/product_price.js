const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  
  const price = parseFloat(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(price * 0.1) + "円";
  
  const profitDom = document.getElementById("profit");
  profitDom.innerHTML = (price - Math.floor(price * 0.1)) + "円";
});