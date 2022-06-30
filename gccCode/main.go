package main

import (
    "fmt"
    "crypto/sha256"
)

func main() {
    sum := sha256.Sum256([]byte("hello world\n"))
    // sum := sha256.Sum256([]byte(""))
    // sum := sha256.Sum256()
    fmt.Printf("%x\n", sum) //a948904f2f0f479b8f8197694b30184b0d2ed1c1cd2a1ec0fb85d299a192a447
}
