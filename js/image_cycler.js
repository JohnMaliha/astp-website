---
---

const background_dir = "/img/sts/backgrounds/"

const imgs = [
{% for st in site.data.sts %}
    background_dir + "{{ st.image }}",
{% endfor %}
]

console.log(imgs)

const node = document.getElementById("background-image-cycle");

const cycleImages = (images, container, step) => {
    images.forEach((image, index) => (
    setTimeout(() => {
        container.style.backgroundImage = `url(${image})`  
    }, step * (index + 1))
))
setTimeout(() => cycleImages(images, container, step), step * images.length)
}

cycleImages(imgs, node, 5000)
