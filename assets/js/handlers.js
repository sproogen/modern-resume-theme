function handeShowMore(event) {
    const list = event.currentTarget.closest(".section-list")
    list.classList.toggle("expanded");
}