const fs = require('fs');
const readline = require('readline');

const readInterface = readline.createInterface({
  input: fs.createReadStream('./VocabList.N1.txt'),

  console: false
});

const words = [];
let counter = 0;
const obj = { kanji: '', yomikata: '', definition: '' };

readInterface.on('line', function (line) {
  switch (counter) {
    case 0:
      obj.kanji = line;
      break;
    case 1:
      obj.yomikata = line;
      break;
    case 2:
      obj.definition = line;
      words.push({ ...obj });
      break;
    default:
      break;
  }
  counter === 2 ? (counter = 0) : (counter += 1);
});

readInterface.on('close', () => {
  fs.writeFile('n1.js', words, (err) => {
    if (err) return console.log(err);
    console.log('all done!');
  });
});
