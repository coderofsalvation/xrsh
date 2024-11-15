term    = document.querySelector('[isoterminal]').components.isoterminal.term
convert = ISOTerminal.prototype.convert

console.test("com/isoterminal/ISOTerminal.js", async () => {

  term.worker.read_file("root/.profile")
  .then( (res) => {
    try{
      let data = convert.Uint8ArrayToString( res )
      console.assert( data.length, "worker.postMessage.promise()")
    }catch(e){
      console.assert( false, "worker.postMessage.promise()")
    }
  })
  .catch(console.error)
  .finally(console.dir)

})

console.test("com/isoterminal/ISOTerminal.js", async () => {

  term.worker.create_file("foo", convert.toUint8Array("hello") )
  .then( (res) => {
    term.worker.read_file("foo")
    .then( (res) => {
      try{
        let data = convert.Uint8ArrayToString( res )
        console.assert( data == "hello", "worker.create_file")
      }catch(e){
        console.assert( false, "worker.create_file")
      }
    })
  })
  .catch(console.error)
  .finally(console.dir)

})
