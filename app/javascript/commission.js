function commission() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('input', () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.floor(itemPrice.value * 0.1);
    profit.innerHTML = Math.floor(itemPrice.value * 0.9);
  });
}
window.addEventListener('load', commission);