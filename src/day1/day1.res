open Node.Fs
open Js.String2
open Js.Array2

let input = readFileSync("input.txt", #ascii)

let sum = input->split("\n")
->map((n) => n->split("")->filter((c) => c >= "1" && c <= "9"))
->reduce((acc, i) => {
  acc + Int.fromString(joinWith([i->unsafe_get(0), i->unsafe_get(i->Js.Array2.length - 1 )], ""))->Belt.Option.getWithDefault(0)
}
,0)

Console.log(sum)

let words = ["nine", "eight", "seven", "six", "five", "four", "three", "two", "one"]

let lettersToDigit = (str) => {
  switch str {
    | "one" => "1"
    | "two" => "2"
    | "three" => "3"
    | "four" => "4"
    | "five" => "5"
    | "six" => "6"
    | "seven" => "7"
    | "eight" => "8"
    | "nine" => "9"
    | _ => ""
  }
}

let sum2 = input->split("\n")
->map((n) => {
  let buf = ref("")
  n->split("")->forEach((ltr) => {
    buf.contents = Js.String.concat(ltr, buf.contents)
    words->forEach(w => {
        buf := buf.contents->replace(w, lettersToDigit(w))
      }
    )
  })
  /* Console.log2(n, buf.contents) */
  buf.contents->split("")->filter((c) => c >= "0" && c <= "9")
})
->reduce((acc, i) => {
  /* Console.log2(i, joinWith([i->unsafe_get(0), i->unsafe_get(i->Js.Array2.length - 1 )], "")) */
  acc + Int.fromString(joinWith([i->unsafe_get(0), i->unsafe_get(i->Js.Array2.length - 1 )], ""))->Belt.Option.getWithDefault(0)
}
,0)

Console.log(sum2)
