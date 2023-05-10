const wrapper = document.querySelector('.wapper');
const registerLink = document.querySelector('.register-link');
const loginLink = document.querySelector('.login-link');
const btPopup = document.querySelector('.btnLogin-popup');
const iconClose = document.querySelector('.fa.fa-times');

registerLink.onclick = () => {
    wrapper.classList.add('active');
};

loginLink.onclick = () => {
    wrapper.classList.remove('active');
};

btPopup.onclick = () => {
    wrapper.classList.add('active-popup');
};

iconClose.onclick = () => {
    wrapper.classList.remove('active-popup');
    wrapper.classList.remove('active');
};

