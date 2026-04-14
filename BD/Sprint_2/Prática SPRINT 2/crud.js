let ipt_comida = "salame"; // salame
let vetor = []
let ipt_nova_comida = "mateus"; // mateus
vetor.push(ipt_comida)
let novo_vetor

console.log(vetor);

for (let i = 0; i < vetor.length; i++) {
    if (ipt_comida == vetor[i]) {
        vetor[i] = ipt_nova_comida;
    };
}

for (let i = 0; i < vetor.length; i++) {
    for (let j = 0; j < vetor.length; j++) {
        if (vetor[i] != novo_vetor[i]) {
            novo_vetor.push(vetor[i]);
        }
        contador++


    }
}
    }
console.log(novo_vetor);

