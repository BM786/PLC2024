//Create list of ints from 1 to 5, Haskell equivalent [1..5]
function arrFunc(a, b){
    let arr = [];
    for (let i = a; i<=b; i++) {
        arr.push(i);
    }
    return arr;    
}

function applicatorFunc(inpFunc, s){
    const arr = inpFunc(); 
    if(s=='s'){       
        return arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
    }
    else{        
        return arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0) / arr.length;
    }
}

let x = applicatorFunc(arrFunc, 's');
console.log(x);
