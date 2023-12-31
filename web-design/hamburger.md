# Multi-level Hamburger Menu

Creating a multi-level hamburger menu from an unordered list with nested lists involves structuring your HTML properly and then using CSS for styling and JavaScript for interactivity. This type of menu is more complex because it includes multiple levels of navigation.

### HTML Structure

Start with an HTML structure that includes your nested unordered lists. Here's an example:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Multi-level Hamburger Menu</title>
    <link rel="stylesheet" href="style.css"> <!-- Link your CSS file -->
</head>
<body>

<button id="hamburger-btn">☰ Menu</button>

<nav id="hamburger-menu">
    <ul>
        <li><a href="#">Home</a></li>
        <li>
            <a href="#">About Us</a>
            <ul>
                <li><a href="#">Our Team</a></li>
                <li><a href="#">Our History</a></li>
            </ul>
        </li>
        <li>
            <a href="#">Services</a>
            <ul>
                <li><a href="#">Web Design</a></li>
                <li>
                    <a href="#">Marketing</a>
                    <ul>
                        <li><a href="#">SEO</a></li>
                        <li><a href="#">Social Media</a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li><a href="#">Contact</a></li>
    </ul>
</nav>

<script src="script.js"></script> <!-- Link your JavaScript file -->

</body>
</html>
```

### CSS Styling

In your CSS file (`style.css`), add styles to handle the display of the menu and sub-menus:

```css
/* style.css */

#hamburger-menu {
    display: none;
    /* Other styling as needed */
}

#hamburger-menu ul {
    list-style: none;
    padding: 0;
}

#hamburger-menu li {
    /* Styling for list items */
}

#hamburger-menu li ul {
    display: none;
}

#hamburger-menu li.active > ul {
    display: block;
}

#hamburger-btn {
    /* Style the hamburger button */
    cursor: pointer;
}

/* Add more styling as needed */
```

### JavaScript Interactivity

Add JavaScript to handle the opening of the main menu and the sub-menus:

```javascript
// script.js

// Toggle main menu
document.getElementById('hamburger-btn').addEventListener('click', function() {
    document.getElementById('hamburger-menu').classList.toggle('active');
});

// Handle sub-menu items
var subMenuItems = document.querySelectorAll('#hamburger-menu li > a');

subMenuItems.forEach(function(item) {
    var parentLi = item.parentElement;
    var subMenu = parentLi.querySelector('ul');

    if (subMenu) {
        item.addEventListener('click', function(event) {
            event.preventDefault();
            parentLi.classList.toggle('active');
        });
    }
});
```

In this script:

- The main menu is toggled when the hamburger button is clicked.
- Each menu item with a sub-menu adds an event listener to toggle the display of its sub-menu.

### Final Steps

- Test your menu to ensure it works as expected. Clicking on a menu item with a sub-menu should expand or collapse the sub-menu.
- Customize the styles in your CSS file to match your site's design.
- You might want to add transitions or animations for smoother interactions.
- Ensure accessibility, particularly for keyboard navigation and screen readers.

This example provides a basic multi-level hamburger menu. You can further customize and enhance it based on your specific needs and design preferences.