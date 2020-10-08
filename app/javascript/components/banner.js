import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Enjoy life", "Explore the nightlife"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
