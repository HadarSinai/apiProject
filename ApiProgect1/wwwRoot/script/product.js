
window.onload = async () => {

    getCategory();
    filterProducts();

    let data = sessionStorage.getItem("ProductsCart")
    let prod = JSON.parse(data)
    if (prod == undefined)
        document.getElementById("ItemsCountText").innerText = 0;
    else {
        document.getElementById("ItemsCountText").innerText = prod.length;

    }
}

const getProducts = async (desc, minPrice, maxPrice, categoryItem) => {
    let k;
    //
    document.getElementById("prod").innerHTML = '';

    let url = `https://localhost:44355/api/Product?`
    if (desc)
        url += `&desc=${desc}`
    if (minPrice || maxPrice) {
        url += `&minPrice=${minPrice}`
        url += `&maxPrice=${maxPrice}`
    }
    if (categoryItem) {
        for (k = 0; k < categoryItem.length; k++) {
            url += `&categoryIds=${categoryItem[k]}`

        }

    }

    try {
        const res = await fetch(url)
        if (!res.ok) {
            throw new Error("we  couldn't load  the products")
        }

        const product = await res.json()

        document.getElementById("counter").innerText = product.length;
        for (var i = 0; i < product.length; i++) {
            showCard(product[i])

        }
        return product;

    }
    catch (ex) {
        alert(ex)

    }

}

const getMaxAndMin = (products) => {
    let minValue = Math.min(...products);
    let MaxValue = Math.max(...products);
    document.getElementById("minPrice").value = minValue;
    document.getElementById("maxPrice").value = MaxValue;
}

const getCategory = async () => {
    try {

        const res = await fetch("api/Category")
        if (!res.ok) {
            throw new Error("we  couldn't load  the caterorys")
        }
        const data = await res.json()


        for (var j = 0; j < data.length; j++) {
            showCategory(data[j]);

        }

    }
    catch (ex) {
        alert(ex)
    }
}



const showCategory = (category) => {
    let div = document.getElementById("categoryList")
    let temp = document.getElementById("temp-category")
    let clone = temp.content.cloneNode(true)
    let checkbox = clone.querySelector(".opt");
    checkbox.id = category.categoryId;
    clone.querySelector(".OptionName").innerText = category.categoryName;
    div.appendChild(clone)
}


const showCard = (data) => {
    let div = document.getElementById("prod")
    /*document.body.appendChild(div);*/
    let temp = document.getElementById("temp-card")
    let clone = temp.content.cloneNode(true)

    clone.querySelector("h1").innerText = data.productName
    clone.querySelector(".price").innerText = data.productPrice + "$"
    /*   clone.querySelector(".category").innerText = data.categoryName;*/
    clone.querySelector(".description").innerText = data.productDescription
    clone.querySelector("img").src = "./potos/" + data.productImage
    clone.querySelector("button").addEventListener('click', () => { addToCart(data) })

    div.appendChild(clone)
    if (sessionStorage.cart != undefined) {
        document.getElementById("ItemsCountText").innerText = (JSON.parse(sessionStorage.getItem("ProductsCart"))).length;
    }


}

const filterProducts = async () => {
    let MAndm = []
    let checkedCategories = []

    let allCategoriesOptions = document.querySelectorAll(".opt");
    for (let i = 0; i < allCategoriesOptions.length; i++) {
        if (allCategoriesOptions[i].checked) {
            checkedCategories.push(allCategoriesOptions[i].id)
        }
    }
    let minPrice = document.getElementById("minPrice").value;
    let maxPrice = document.getElementById("maxPrice").value;
    let desc = document.getElementById("nameSearch").value;
    let products = await getProducts(desc, minPrice, maxPrice, checkedCategories);
    MAndm = products.map(prod => prod.productPrice)
    getMaxAndMin(MAndm);



}

let arrayCart = []
const addToCart = (product) => {

    document.getElementById("ItemsCountText").innerText++;
    let data = sessionStorage.getItem("ProductsCart")
    arrayCart = JSON.parse(data)
    if (arrayCart == null) {
        arrayCart = []
        arrayCart.push(product);
    }
    else if (arrayCart != null) {
        arrayCart = [...arrayCart, product]
    }
    sessionStorage.setItem("ProductsCart", JSON.stringify(arrayCart));

    alert(`${product.productName} Added to cart`)
    //cart = cart.filter(prod => prod != data);
    //sessionStorage.setItem("ProductsCart", JSON.stringify(cart))
    //document.querySelector("tbody").replaceChildren([])
}


//const TrackLinkID = () => {
//    sessionStorage.getItem("user") ? document.querySelector(".myAccount").href = "/Update.html" : document.querySelector(".myAccount").href = "/Login.html"
//}
