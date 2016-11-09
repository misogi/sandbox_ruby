class Hell {
  public count(cnt: number):string {
    return "hello" + cnt;
  } 
};

const hell = new Hell();
console.log(Hell.count(3));