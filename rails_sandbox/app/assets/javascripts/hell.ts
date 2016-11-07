class Hell {
  public count(cnt: number):string {
    return "hello" + cnt;
  } 
};

const hell = new Hell();
console.log(hell.count(3));