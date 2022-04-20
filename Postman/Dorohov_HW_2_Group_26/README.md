## HW_2 Postman

`http://162.55.220.72:5005/first`

1. Отправить запрос.

2. Статус код 200
```js
pm.test("Статус код 200", function () {
    pm.response.to.have.status(200);
});
```

3. Проверить, что в body приходит правильный string.
```js
pm.test("В ответ получаем верную строку", function () {
    pm.expect(pm.response.text()).to.include("This is the first responce from server!");
});
```

<hr>

`http://162.55.220.72:5005/user_info_3`

1. Отправить запрос.

3. Статус код 200
```js
pm.test("Статус код 200", function () {
    pm.response.to.have.status(200);
});
```

4. Спарсить response body в json.
```js
let jsonData = pm.response.json();
```

5. Проверить, что name в ответе равно name s request (name вбить руками.)
```js
pm.test("name = Vladimir", function () {
    pm.expect(jsonData.name).to.eql("Vladimir");
});
```
7. Проверить, что age в ответе равно age s request (age вбить руками.)
```js
pm.test("age = 30", function () {
    pm.expect(jsonData.age).to.eql("30");
});
```

9. Проверить, что salary в ответе равно salary s request (salary вбить руками.)
```js
pm.test("salary = 1000", function () {
    pm.expect(jsonData.salary).to.eql(1000);
});
```

11. Спарсить request.
```js
let reqData = request.data;
// создадим переменную salaryInt и присвоим ей преобразованное в int значение reqData.salary 
let salaryInt = +(reqData.salary);
```

13. Проверить, что name в ответе равно name s request (name забрать из request.)
```js
pm.test("Response name = Request name", function () {
    pm.expect(jsonData.name).to.eql(reqData.name);
});
```

15. Проверить, что age в ответе равно age s request (age забрать из request.)
```js
pm.test("Response age = Request age", function () {
    pm.expect(jsonData.age).to.eql(reqData.age);
});
```

17. Проверить, что salary в ответе равно salary s request (salary забрать из request.)
```js
pm.test("Response salary = Request salary", function () {
    pm.expect(jsonData.salary).to.eql(salaryInt);
});
```

19. Вывести в консоль параметр family из response.
```js
console.log(jsonData.family);
```

21. Проверить что u_salary_1_5_year в ответе равно salary*4 (salary забрать из request)
```js
salaryInt = salaryInt*4;
pm.test("Response u_salary_1_5_year = salary*4", function () {
    pm.expect(jsonData.family.u_salary_1_5_year).to.eql(salaryInt);
});
```

<hr>

`http://162.55.220.72:5005/object_info_3`

1. Отправить запрос.

3. Статус код 200
```js
pm.test("Статус код 200", function () {
    pm.response.to.have.status(200);
});
```

3. Спарсить response body в json.
```js
let jsonData = pm.response.json();
```

5. Спарсить request.
```js
let reqData = pm.request.url.query.toObject();
// создадим переменную salaryInt и присвоим ей преобразованное в int значение reqData.salary 
let salaryInt = +(reqData.salary)
```

7. Проверить, что name в ответе равно name s request (name забрать из request.)
```js
pm.test("Response name = Request name", function () {
    pm.expect(jsonData.name).to.eql(reqData.name);
});
```

9. Проверить, что age в ответе равно age s request (age забрать из request.)
```js
pm.test("Response age = Request age", function () {
    pm.expect(jsonData.age).to.eql(reqData.age);
});
```

11. Проверить, что salary в ответе равно salary s request (salary забрать из request.)
```js
pm.test("Response salary = Request salary", function () {
    pm.expect(jsonData.salary).to.eql(salaryInt);
});
```

13. Вывести в консоль параметр family из response.
```js
console.log(jsonData.family);
```

15. Проверить, что у параметра dog есть параметры name.
```js
pm.test("Dog has a name", function () {
    pm.expect(jsonData.family.pets.dog).to.have.property("name");
});
```

17. Проверить, что у параметра dog есть параметры age.
```js
pm.test("Dog has a age", function () {
    pm.expect(jsonData.family.pets.dog).to.have.property("age");
});
```

19. Проверить, что параметр name имеет значение Luky.
```js
pm.test("Dog name = Luky", function () {
    pm.expect(jsonData.family.pets.dog.name).to.eql("Luky");
});
```

21. Проверить, что параметр age имеет значение 4.
```js
pm.test("Dog age = 4", function () {
    pm.expect(jsonData.family.pets.dog.age).to.eql(4);
});
```

<hr>

`http://162.55.220.72:5005/object_info_4`

1. Отправить запрос.

3. Статус код 200
```js
pm.test("Статус код 200", function () {
    pm.response.to.have.status(200);
});
```

3. Спарсить response body в json.
```js
let jsonData = pm.response.json();
```

5. Спарсить request.
```js
let reqData = pm.request.url.query.toObject();
// создадим переменную salaryInt и присвоим ей преобразованное в int значение reqData.salary 
let salaryInt = +(reqData.salary)
```

7. Проверить, что name в ответе равно name s request (name забрать из request.)
```js
pm.test("Response name = Request name", function () {
    pm.expect(jsonData.name).to.eql(reqData.name);
});
```

9. Проверить, что age в ответе равно age из request (age забрать из request.)
```js
ageInt = Number(jsonData.age);
pm.test("Response age = Request age", function () {
    pm.expect(jsonData.age).to.eql(ageInt);
});
```

11. Вывести в консоль параметр salary из request.
```js
console.log("Request salary ===> ", reqData.salary);
```

13. Вывести в консоль параметр salary из response.
```js
console.log("Rsponse salary ===> ", jsonData.salary);
```

15. Вывести в консоль 0-й элемент параметра salary из response.
```js
console.log("Вывод из списка salary, элемента 0 ===> ", jsonData.salary[0]);
```

17. Вывести в консоль 1-й элемент параметра salary параметр salary из response.
```js
console.log("Вывод из списка salary, элемента 1 ===> ", jsonData.salary[1]);
```

19. Вывести в консоль 2-й элемент параметра salary параметр salary из response.
```js
console.log("Вывод из списка salary, элемента 2 ===> ", jsonData.salary[2]);
```

21. Проверить, что 0-й элемент параметра salary равен salary из request (salary забрать из request.)
```js
salaryInt = Number(reqData.salary);
pm.test("Response salary [0] = Request salary", function () {
    pm.expect(jsonData.salary[0]).to.eql(salaryInt);
});
```

23. Проверить, что 1-й элемент параметра salary равен salary*2 из request (salary забрать из request.)
```js
pm.test("Response salary [1] = Request salary", function () {
    pm.expect(jsonData.salary[1]).to.eql+(salaryInt*2);
});
```

25. Проверить, что 2-й элемент параметра salary равен salary*3 из request (salary забрать из request.)
```js
pm.test("Response salary [1] = Request salary", function () {
    pm.expect(jsonData.salary[2]).to.eql+(salaryInt*3);
});
```

27. Создать в окружении переменную name

29. Создать в окружении переменную age

31. Создать в окружении переменную salary

33. Передать в окружение переменную name
```js
pm.environment.set("name", jsonData.name);
```

35. Передать в окружение переменную age
```js
pm.environment.set("age", jsonData.age);
```

37. Передать в окружение переменную salary
```js
pm.environment.set("salary", jsonData.salary[0]);
```

39. Написать цикл который выведет в консоль по порядку элементы списка из параметра salary.
```js
for (let i = 0; i < jsonData.salary.length; i++) {
  // Этот код выполняется для каждого элемента
  console.log("Вывод из списка, элемента с индексом " + i + ": " +jsonData.salary[i]);
}
// или
// for (let i of jsonData.salary){
//     console.log(i)
// }
```

<hr>

`http://162.55.220.72:5005/user_info_2`

1. Вставить параметр salary из окружения в request

3. Вставить параметр age из окружения в age

5. Вставить параметр name из окружения в name

7. Отправить запрос.

9. Статус код 200
```js
pm.test("Статус код 200", function () {
    pm.response.to.have.status(200);
});
```

6. Спарсить response body в json.
```js
let jsonData = pm.response.json();
```

8. Спарсить request.
```js
let reqData = request.data
```

10. Проверить, что json response имеет параметр start_qa_salary
```js
pm.test("json response имеет параметр start_qa_salary", function () {
    pm.expect(jsonData).to.have.property("start_qa_salary");
});
```

12. Проверить, что json response имеет параметр qa_salary_after_6_months
```js
pm.test("json response имеет параметр qa_salary_after_6_months", function () {
    pm.expect(jsonData).to.have.property("qa_salary_after_6_months");
});
```

14. Проверить, что json response имеет параметр qa_salary_after_12_months
```js
pm.test("json response имеет параметр qa_salary_after_12_months", function () {
    pm.expect(jsonData).to.have.property("qa_salary_after_12_months");
});
```

16. Проверить, что json response имеет параметр qa_salary_after_1.5_year
```js
pm.test("json response имеет параметр qa_salary_after_1.5_year", function () {
    pm.expect(jsonData).to.have.property("qa_salary_after_1.5_year");
});
```

18. Проверить, что json response имеет параметр qa_salary_after_3.5_years
```js
pm.test("json response имеет параметр qa_salary_after_3.5_years", function () {
    pm.expect(jsonData).to.have.property("qa_salary_after_3.5_years");
});
```

20. Проверить, что json response имеет параметр person
```js
pm.test("json response имеет параметр person", function () {
    pm.expect(jsonData).to.have.property("person");
});
```

22. Проверить, что параметр start_qa_salary равен salary из request (salary забрать из request.)
```js
pm.test("Response start_qa_salary = Request start_qa_salary", function () {
    pm.expect(jsonData.start_qa_salary).to.eql(+reqData.salary);
});
```

24. Проверить, что параметр qa_salary_after_6_months равен salary*2 из request (salary забрать из request.)
```js
pm.test("Response qa_salary_after_6_months = Request qa_salary_after_6_months", function () {
    pm.expect(jsonData.qa_salary_after_6_months).to.eql(reqData.salary*2);
});
```

26. Проверить, что параметр qa_salary_after_12_months равен salary*2.7 из request (salary забрать из request.)
```js
pm.test("Response qa_salary_after_12_months = Request qa_salary_after_12_months", function () {
    pm.expect(jsonData.qa_salary_after_12_months).to.eql(reqData.salary*2.7);
});
```

28. Проверить, что параметр qa_salary_after_1.5_year равен salary*3.3 из request (salary забрать из request.)
```js
pm.test("Response qa_salary_after_1.5_year = Request qa_salary_after_1.5_year", function () {
    pm.expect(jsonData['qa_salary_after_1.5_year']).to.eql(reqData.salary*3.3);
});
```

30. Проверить, что параметр qa_salary_after_3.5_years равен salary*3.8 из request (salary забрать из request.)
```js
pm.test("Response qa_salary_after_3.5_years = Request qa_salary_after_3.5_years", function () {
    pm.expect(jsonData['qa_salary_after_3.5_years']).to.eql(+reqData.salary*3.8);
});
```

32. Проверить, что в параметре person, 1-й элемент из u_name равен salary из request (salary забрать из request.)
```js
pm.test("В response параметре person, 1-й элемент из u_name равен salary из request", function () {
    pm.expect(jsonData.person.u_name[1]).to.eql(+reqData.salary);
});
```

34. Проверить, что что параметр u_age равен age из request (age забрать из request.)
```js
pm.test("В response параметре person, элемент u_age равен age из request", function () {
    pm.expect(jsonData.person.u_age).to.eql(+reqData.age);
});
```

36. Проверить, что параметр u_salary_5_years равен salary*4.2 из request (salary забрать из request.)
```js
pm.test("В response параметре person, элемент u_salary_5_years равен salary*4.2 из request", function () {
    pm.expect(jsonData.person.u_salary_5_years).to.eql(+reqData.salary*4.2);
});
```

38. ***Написать цикл который выведет в консоль по порядку элементы списка из параметра person.
```js
for (let i = 0; i < jsonData.person.u_name.length; i++) {
  // Этот код выполняется для каждого элемента
  console.log("Вывод из списка, элемента с индексом " + i + ": " + jsonData.person.u_name[i]);
}
// или 
/*
for (let i of jsonData.person.u_name){
    console.log(i)
}
*/
// или 
/*
for(let KEY in jsonData.person) {
   if(typeof(jsonData.person[KEY]) == "object"){
       for(let i = 0; i < Object.keys(jsonData.person[KEY]).length; i++){
           console.log(jsonData.person[KEY][i]);
       }
   }
   else if(typeof(jsonData.person[KEY]) != "object") {
        console.log(jsonData.person[KEY]);
   }
}
*/
```

