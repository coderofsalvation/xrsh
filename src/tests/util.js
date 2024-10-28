
// minimalistc testrunner
console.test = async (name,cb) => {
  let tests = console.test.tests = console.test.tests || {}
  tests[name] = tests[name] || []
  tests[name].push(cb)
  console.test.run = async () => {
    for( let name in tests ){
      console.log("\x1b[34m\x1b[36;49m"+name+"\x1B[m")
      for( let test in tests[name] ){
        await tests[name][test]()
      }
    }
  }
}

console.assert = ((assert) => (a,reason,data) => {
  console.log("\x1b[34m\x1b[36;49m♥ \x1B[m"+reason)
  assert.call( console, a, {reason} )
  if( !a ){
    console.dir(data)
    throw 'abort..'
  }

})(console.assert)
