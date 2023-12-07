
const getAllProducts = async( desc,  minPrice,  maxPrice, categoryIds) => {
    try {
        let url = `https://localhost:44354/api/Products`;
        if (desc || minPrice || maxPrice || categoryIds)url+=`?`
        if (desc) url += `&desc=${desc}`;
        if (minPrice) url += `&minPrice=${minPrice}`;
        if (maxPrice) url += `&maxPrice=${maxPrice}`;
        if (categoryIds) { 
        for (let i = 0; i < categoryIds.length; i++) {
            url +=`&categoryIds=${categoryIds[i]}`
        }}
        const res = await fetch(url);
        const products = await res.json();
        return products
    } catch (e) {
        console.log(e)
    }
}
const getAllCategories = async () => {
    try {
        const res = await fetch("https://localhost:44354/api/Categories");
        const categories = await res.json();
        return categories
    } catch (e) {
        console.log(e)
    }
}
const addToCart =(product) => {
    document.getElementById("ItemsCountText").innerText++;
    if (sessionStorage.cart == undefined) sessionStorage.setItem("cart", "[]");
    let cart = JSON.parse(sessionStorage.getItem("cart"));
    MYcart = [...cart, product]
    let myCart = JSON.stringify(MYcart);
    sessionStorage.cart = myCart;
}

const showProducts = async () => {
    const products = await getAllProducts();
    for (let i = 0; i < products.length;i++) {
        let tmp = document.getElementById("temp-card");
        let clone = tmp.content.cloneNode(true);
        clone.querySelector("img").src = "./images/" + products[i].productImage;
        clone.querySelector("h1").innerText = products[i].productName;
        clone.querySelector(".description").innerText = products[i].productDescription
        clone.querySelector(".category").innerText = products[i].categoryName;
        let btn = clone.querySelector("button");
        btn.addEventListener('click', () => { addToCart(products[i]) });
        clone.querySelector(".price").innerText = products[i].productPrice +"$";
        document.getElementById("PoductList").appendChild(clone);
    }
    document.getElementById("counter").innerText = products.length;
    if (sessionStorage.cart != undefined) { 
    document.getElementById("ItemsCountText").innerText = (JSON.parse(sessionStorage.getItem("cart"))).length;} 
}
const filterProducts = async () => {
    let checkedCategories = [];
    const allCategoriesOptions = document.querySelectorAll(".opt");
    for (let i = 0; i < allCategoriesOptions.length; i++) {
        if (allCategoriesOptions[i].checked) checkedCategories.push(allCategoriesOptions[i].id)
    }
    let minPrice = document.getElementById("minPrice").value;
    let maxPrice = document.getElementById("maxPrice").value;
    let desc = document.getElementById("nameSearch").value;
    const products = await getAllProducts(desc, minPrice, maxPrice, checkedCategories);
    document.getElementById("PoductList").replaceChildren([]);
    for (let i = 0; i < products.length; i++) {
        let tmp = document.getElementById("temp-card");
        let clone = tmp.content.cloneNode(true);
        clone.querySelector("img").src = "./images/" + products[i].productImage;
        clone.querySelector("h1").innerText = products[i].productName;
        clone.querySelector(".description").innerText = products[i].productDescription
        clone.querySelector(".price").innerText = products[i].productPrice + "$";
        clone.querySelector("button").addEventListener('click', () => { addToCart(products[i])});
        document.getElementById("PoductList").appendChild(clone);
    }
    document.getElementById("counter").innerText = products.length;
}

const showCategories = async () => {
    const categories = await getAllCategories();
    for (var i = 0; i < categories.length; i++) {
        let tmp = document.getElementById("temp-category");
        let clone = tmp.content.cloneNode(true);
        clone.querySelector("label").for = categories[i].categoryName;
        clone.querySelector("input").value = categories[i].categoryName;
        clone.querySelector("input").id = categories[i].categoryId;
        clone.querySelector(".OptionName").innerText = categories[i].categoryName;
        document.getElementById("categoryList").appendChild(clone);
    }
}
const TrackLinkID = () => {
    sessionStorage.getItem("user")?document.querySelector(".myAccount").href = "/Update.html":document.querySelector(".myAccount").href="/Login.html"
}
