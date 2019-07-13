---
---

const step = 5000;
const background_dir = "/img/sts/backgrounds/";
const imgs = [
    {% for st in site.data.sts %}
    background_dir + "{{ st.image }}",
    {% endfor %}
];

// From: https://stackoverflow.com/a/6274381
function shuffle(a) {
    for (let i = a.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [a[i], a[j]] = [a[j], a[i]];
    }
    return a;
}

shuffle(imgs);

// From: https://stackoverflow.com/a/37243062
function setImg(image, container) {
    container.style.backgroundImage = `url(${image})`;
}
const cycleImages = (images, container, step) => {
    images.forEach((image, index) => {
        setTimeout(() => {
            setImg(image, container);
        }, step * (index + 1));
    });
    setTimeout(() => cycleImages(images, container, step), step * images.length);
}

const node = document.getElementById("background-image-cycle");
cycleImages(imgs, node, step);
