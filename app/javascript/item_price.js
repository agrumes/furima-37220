function commission (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const addProfit = document.getElementById("profit");
    const taxDom =  Math.floor(inputValue * 0.1);
    addProfit.innerHTML = Math.floor(inputValue - taxDom);
  })
};

window.addEventListener('load', commission);

