
window.onload = async () => {
   
    getCategory();
    filterProducts();
   
}

const getProducts = async (desc, minPrice, maxPrice, categoryItem) => {
    let k;
    document.getElementById("prod").replaceChildren([]);
    
    let url = `https://localhost:44355/api/Product`
    if (desc || minPrice || maxPrice || categoryItem) {
        url += `?&desc=${desc} &minPrice=${minPrice} &maxPrice=${maxPrice}`
        if (categoryItem) {
            for (k = 0; k < categoryItem.length; k++) {
                url += `&categoryIds=${categoryItem[k]}`
            }
        }
    }
        try {
            const res = await fetch(url)
            if (!res.ok) {
                throw new Error("we  couldn't load  the products")
            }
            const product = await res.json()
            for (var i = 0; i < product.length; i++) {
                showCard(product[i])
                return product;
            }
        }
        catch (ex) {
            alert(ex)

    }
        //    let url = `https://localhost:44355/api/Product`;
    //if (desc || minPrice || maxPrice || categoryItem) url += `?`
    //    if (desc) url += `&desc=${desc}`;
    //    if (minPrice) url += `&minPrice=${minPrice}`;
    //    if (maxPrice) url += `&maxPrice=${maxPrice}`;
    //if (categoryItem) {
    //        for (let i = 0; i < categoryItem.length; i++) {
    //            url += `&categoryIds=${categoryItem[i]}`
    //        }
    //    }
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
    


const showCategory = async (category) => {
    let div = document.getElementById("categoryList")
    let temp = document.getElementById("temp-category")
    let clone = temp.content.cloneNode(true)
    clone.querySelector("span.OptionName").innerText = category.categoryName
    div.appendChild(clone)
}


const showCard = async (data) => {
    let div = document.getElementById("prod")
    /*document.body.appendChild(div);*/
    let temp = document.getElementById("temp-card")
    let clone = temp.content.cloneNode(true)
    clone.querySelector("img").src = "./potos" + data.productImage
    clone.querySelector("h1").innerText = data.productName
    clone.querySelector("p.price").innerText = data.productPrice+ "$"
    clone.querySelector("p.description").innerText = data.productDescription
    clone.querySelector("button").addEventListener('click', () => { addToCart(data) })
    div.appendChild(clone)
    
}

const filterProducts = async () => {
    let j;
  
    let checkedCategories = [];
    const allCategoriescheck = document.getElementsByClassName("opt");

    for ( j = 0; j < allCategoriescheck.length; j++) {
        if (allCategoriescheck[j].checked)
            checkedCategories.push(allCategoriescheck[j].id)
        }
    let minPrice = document.getElementById("minPrice").value;
    let maxPrice = document.getElementById("maxPrice").value;
        let desc = document.getElementById("nameSearch").value;
    let products = await getProducts(desc, minPrice, maxPrice, checkedCategories);
    console.log(products);
    /*document.getElementById("prod").replaceChildren([]);*/
        for (var i = 0; i < products.length; i++) {
            let tmp = document.getElementById("temp-card");
            let clone = tmp.content.cloneNode(true);
            clone.querySelector("img").src = "./potos/" + products[i].productImage;
            clone.querySelector("h1").innerText = products[i].productName;
            clone.querySelector(".description").innerText = products[i].productDescription
            clone.querySelector(".price").innerText = products[i].productPrice + "$";
            clone.querySelector("button").addEventListener('click', () => { addToCart(products[i])})
            document.getElementById("prod").appendChild(clone);
    }


}

let arrayCart=[]
const addToCart = (product) => {
    if (product != null) { 
    arrayCart.push(product)
    sessionStorage.setItem("ProductsCart", JSON.stringify(arrayCart));
     
        alert(`${product.productName } Added to cart`)
     
    }
 
}
const TrackLinkID = () => {
    sessionStorage.getItem("user") ? document.querySelector(".myAccount").href = "/Update.html" : document.querySelector(".myAccount").href = "/Login.html"
}
