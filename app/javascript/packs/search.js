var searchForm = document.querySelector("#search-form")
var couponsDiv = document.querySelector('#coupons')

searchForm.addEventListener("ajax:success", (event) => {
  const [_data, _status, xhr] = event.detail
  const coupons = JSON.parse(xhr.response)
  couponsDiv.innerHTML = ""
  coupons.forEach((coupon) => {
    couponsDiv.insertAdjacentHTML("beforeend", coupon.code)
  })
})
searchForm.addEventListener("ajax:error", () => {
  couponsDiv.innerHTML = ""
  couponsDiv.insertAdjacentHTML("beforeend", "<p>OPA deu erroooo</p>")
})
