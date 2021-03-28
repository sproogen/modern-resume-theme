// Deals with enabling/disabling dark theme when required.

var theme = "theme";
var dark_mode = "dark";
var light_mode = "light";

/**
 * A simple wrapper to modify the value of cookies used to keep a track of 
 * website theme.
 * 
 * @param {boolean} enableDarkMode Modifies the value of cookies to 
 * enable/disable dark mode.
 * @returns none
 */
function modifyCookies(enableDarkMode) {
    window.localStorage.setItem(theme, enableDarkMode ? dark_mode : light_mode);
}

/**
 * Wrapper function to read cookes and check if dark mode is enabled or not.
 * 
 * @returns {String} String value containing either `dark_mode`, `light_mode` or null
 */
function getCurTheme() {
    return window.localStorage.getItem(theme);
}

/**
 * Initial setup method - will read the value of stored cookies to check 
 * if dark mode is enabled or not.
 * 
 * Does not make any changes to the values of cookies. Function designed 
 * to be run when the web-page loads, will simply read the value of existing
 * cookies (if any), and enable dark mode if required.
 */
function setupTheme() {
    // If neither one of the if-else ladder condition is true, do not modify
    // the theme - ensures that if the user is visiting for the first time,
    // the theme defaults to the value of `_config.yml/darkmode`
    if (getCurTheme() === dark_mode)
        // Dark mode is required
        document.body.classList.add(dark_mode); // enable dark mode
    else if (getCurTheme() === light_mode)
        // Note: Intentionally not removing the element from class list. Ensures
        // functionality of `darkmode` variable in _configs.yml doesn't break.
        document.body.classList.remove(dark_mode); // disable dark mode
}

/**
 * Toggles the website theme between dark-mode and normal.
 */
function modifyTheme() {
    if (getCurTheme() === dark_mode) {
        // Current mode is dark mode, switch to light
        window.localStorage.setItem(theme, light_mode);
        document.body.classList.remove(dark_mode);
    } else {
        // Assume dark mode is being turned off, enable it
        window.localStorage.setItem(theme, dark_mode);
        document.body.classList.add(dark_mode);
    }
}

/**
 * Adding an event listener to detect when the webpage is brought back
 * in focus. Ensures synced website theme across multiple simultaneous 
 * sessions, i.e. if the theme is changed in one tab - other tabs will
 * sync with the changes as soon as they are brought back in focus.
 */
document.addEventListener("visibilitychange", function(val) {
    if (!document.hidden)
        setupTheme();
});