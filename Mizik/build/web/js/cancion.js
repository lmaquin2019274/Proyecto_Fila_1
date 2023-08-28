let currentMusic = 0;

const music = document.querySelector('#audio');

const elemento = document.querySelector('.elemento');
const coverArt = document.querySelector('.cover-art');
const currentTime = document.querySelector('.current-time');
const playButton = document.querySelector('.play-button');
const prevButton = document.querySelector('.prev-button');
const nextButton = document.querySelector('.next-button');

playButton.addEventListener('click', () => {
    playButton.classList.toggle('pause');
})

const setMusic = (i) => {
    SeekBar.value = 0;
    let song = songs[i];
    c
}