import Foundation
/*:
 # Desafios
 ## Desafio 1 - Bitwise e Bit Shift
 Existem também operadores que trabalham diretamente com o binário dos seus valores. Esses operadores já não são tão conhecidos, mas são interessantes de se trabalhar.
 São os operadores Bitwise e Bit Shift, fica como desafio estudar um pouco sobre eles.
*/
// Bitwise ou bia-a-bit
let b1 = 0b00000001 // 1
let b2 = 0b00000011 // 3

print(b1 & b2)
print(b1 | b2)


// Bit Shift

// 00000001 - 1
// 00000010 - 2

var b3 = 0b0100101
print(b3 << 2)
print(b3 >> 2)

/*:
 ## Desafio 2 - Collections
 Todas as coleções possuem mais de uma maneira de serem iniciadas. O desafio é buscar algumas dessas maneiras e tentar criar uma coleção a partir de outra, como:
 - Um set de um array;
 - Um array de um dicionário;
 - Um subarray ou array composto por outros arrays;
 */
let a = [0, 1, 2, 3, 4, 4]
let s = Set(a)

print(s)

let d = [
    "Pedro": 22,
    "Marco": 17
]

let names = Array(d.keys)
let ages = Array(d.values)

print(names)
print(ages)

let b = [10, 20, 30]
print(a + b)
let c = Array(a[1..<3])

print(c, type(of: c))
/*:
 ## Desafio 3 - URLs
 Dado um array de urls, que estão usando o protocolo http de maneira insegura, você tem que adicionar um s ao fim do http, mas cuidado, nem todos os links estão errados. Após a correção crie uma nova variável chamada "correctURLs" contendo as strings corretas
 */

let urls = ["https://www.apple.com",
            "http://www.meusite.com.br",
            "http://www.bila.com",
            "https://www.ceara.com",
            "https://www.iphone.com"]

var newURLs = [String]()

for url in urls {
    if url.hasPrefix("https") {
        newURLs.append(url)
    } else if let index = url.firstIndex(of: ":") {
        var newURL = url
        newURL.insert("s", at: index)
        newURLs.append(newURL)
    }
}

print(newURLs)
/*:
 ## Desafio 4 - Caesar Cipher
 Utilizando os conhecimentos adiquiridos até o momento crie um script que aplique a criptografia Rot13, ou Caesar Cipher, em uma string.
 Obs: Você pode utilizar apenas o alfabeto em minúsculo.
 */
let alphabet = "abcdefghijklmnopqrstuvwxyz"

let text = "pedro" // crqeb
var cipher = ""

for letter in text {
    if let index = alphabet.firstIndex(of: letter) {
        var offset = alphabet.distance(from: alphabet.startIndex,
                                       to: index) + 13
        if offset > alphabet.count {
            offset -= alphabet.count
        }

        let newIndex = alphabet.index(alphabet.startIndex, offsetBy: offset)
        cipher.append(alphabet[newIndex])
    } else {
        cipher.append(letter)
    }
}

print(cipher)

/*:
 ## Desafio 5 - Números Pares
 Dado um ClosedRange, exiba no terminal apenas aqueles que são números pares.
 */
for number in 0...10 {
    if number % 2 == 0 {
        print(number)
    }
}

/*:
 ## Desafio 6 - Números Ímpares
 Dado um ClosedRange, exiba no terminal apenas aqueles que são números ímpares.
 */
for number in 0...10 {
    if number % 2 != 0 {
        print(number)
    }
}

/*:
 ## Desafio 7 - Números Primos
 Escreva um script em swift que a partir de uma variável “number” do tipo Int, exibe no terminal se ela é ou não um número primo.
 */
let number = 10
var isPrime = true
for n in 2..<number {
    isPrime = (number % n != 0)
    if !isPrime {
        break
    }
}

if isPrime {
    print("É um número primo.")
} else {
    print("Não é um número primo.")
}
/*:
 ## Desafio 8 - Espaços
 Dado uma string qualquer, remova todos os espaços existentes e exiba nova string no terminal.
 */
let txt = "the quick brown fox jumped over the lazy dog"
print(txt.replacingOccurrences(of: " ", with: ""))

/*:
 ## Desafio 9 - Datas
 Utilizando o tipo Date, crie uma data e transforme-a em uma string com um formato semelhante à “14 de setembro de 2022”.
 */
let hoje = Date()
let formatter = DateFormatter()
formatter.dateFormat = "dd 'de' MMMM 'de' yyyy"
formatter.locale = Locale(identifier: "pt_BR")

print(formatter.string(from: hoje))

/*:
 ## Desafio 10 - Segundos
 Dado uma Int contendo um tempo em segundos exiba no terminal esse tempo convertido no padrão “HH:mm:ss”.
 */
var seconds: Int = 123

let hour: Int = seconds / (60 * 60)
seconds -= hour * (60 * 60)

let minutes: Int = seconds / 60
seconds -= minutes * 60

let hourStr = (hour < 10) ? "0\(hour)" : "\(hour)"
let minutesStr = (minutes < 10) ? "0\(minutes)" : "\(minutes)"
let secondsStr = (seconds < 10) ? "0\(seconds)" : "\(seconds)"

print("\(hourStr):\(minutesStr):\(secondsStr)")
