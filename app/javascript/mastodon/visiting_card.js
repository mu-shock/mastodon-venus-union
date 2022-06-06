export const visiting_card_clicked = e => {
	navigator.clipboard.writeText(element.innerText).then(() => {
		console.log("A visiting card id has been copied to clipboard.");
	}, () => {
		console.warning("Failed to copy a visiting card id.");
	})
};
export const register_visiting_card_event = () => {
	const links = document.getElementsByClassName('visiting-card__link');
	if(links === undefined) return;
	for(var i = 0;i < links.length;i++) {
		links[i].addEventListener('click', visiting_card_clicked);
	}
};


