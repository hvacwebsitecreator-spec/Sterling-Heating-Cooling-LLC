const fs = require('fs');
const path = 'C:/Users/vedpa/OneDrive/Desktop/MONEY 2/index.html';
let text = fs.readFileSync(path, 'utf8');
text = text.replace(/<img[^>]*src="data:image\/[^\"]+"[^>]*>/gi, '<img src="sterling-logo.png" alt="Sterling Heating and Cooling logo" />');
text = text.replace(/<img class="logo" src="sterling-logo\.png"[^>]*>/gi, '<img class="logo" src="sterling-logo.png" alt="Sterling Heating and Cooling logo" />');
fs.writeFileSync(path, text, 'utf8');
console.log('updated logos');
