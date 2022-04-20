## HW_3 Postman

### 1. Необходимо залогиниться `http://162.55.220.72:5005/login`
```
POST
login : str
password : str
```
+ Приходящий токен необходимо передать во все остальные запросы.
```js
// Парсим response
var jsonData = pm.response.json();
// Сохраняем token в окружение
pm.environment.set("token", jsonData.token);
```
+ дальше все запросы требуют наличие токена.

<hr>

### 2. `http://162.55.220.72:5005/user_info`
```
POST
age: int
salary: int
name: str
auth_token
```
+ Request (RAW JSON)
```json
{
"age": 30,
"salary": 1000,
"name": "Vladimir",
"auth_token": "{{token}}"
}
```


+ Response
```json
{
    "start_qa_salary":"salary",
    "qa_salary_after_6_months": "salary * 2",
    "qa_salary_after_12_months": "salary * 2.9",
    "person": {
                "u_name":[
                            "user_name", 
                            "salary", 
                            "age"
                        ],
                "u_age":"age",
                "u_salary_1.5_year": "salary * 4"
    }
}
```

+ Тесты:
1. Статус код 200
```js
pm.test("Статус код 200", function () {
    pm.response.to.have.status(200);
});
```

2. Проверка структуры json в ответе.

```js
let schema = {
    "type": "object",
    "properties": {
    "person": {
      "type": "object",
      "properties": {
        "u_age": {
          "type": "integer"
        },
        "u_name": {
          "type": "array",
          "items": [
            {
              "type": "string"
            },
            {
              "type": "integer"
            },
            {
              "type": "integer"
            }
          ]
        },
        "u_salary_1_5_year": {
          "type": "integer"
        }
      },
    },
    "qa_salary_after_12_months": {
      "type": "number"
    },
    "qa_salary_after_6_months": {
      "type": "integer"
    },
    "start_qa_salary": {
      "type": "integer"
    },
  },
  //"additionalProperties": false
}

pm.test("Validate JSON schema", function() {
  let data = JSON.parse(responseBody);
  let valid = tv4.validate(data, schema, false, true);
  if (valid !== true) {
      console.log(tv4.error);
  }
  pm.expect(valid).to.be.true;
});

// или 

/*
let jsonData = pm.response.json();
pm.test('Response schema type nodes verification', function() {
  pm.expect(tv4.validate(pm.response.json(), schema, true, true)).to.be.true;
});
*/

// или с "additionalProperties": false

/*
pm.test("Validate JSON schema", function ()  {
    pm.response.to.have.jsonSchema(schema);
})
*/

// или с "additionalProperties": false

/*
pm.test("Validate JSON schema", function () {
    pm.expect(tv4.validate(jsonData, schema)).to.be.true;
});
*/
```

3. В ответе указаны коэффициенты умножения salary, напишите тесты по проверке правильности результата перемножения на коэффициент.

```js
pm.test("start_qa_salary = 1000", function () {
    pm.expect(jsonData.start_qa_salary).to.eql+(reqData.salary);
});
```
```js
pm.test("start_qa_salary * 2 = 2000 qa_salary_after_6_months", function () {
    pm.expect(jsonData.start_qa_salary*2).to.eql(jsonData.qa_salary_after_6_months);
});
```
```js
pm.test("start_qa_salary * 2.9 = 2900 qa_salary_after_12_months", function () {
    pm.expect(jsonData.start_qa_salary*2.9).to.eql(jsonData.qa_salary_after_12_months);
});
```
```js
pm.test("start_qa_salary * 4 = 4000 u_salary_1_5_year", function () {
    pm.expect(jsonData.start_qa_salary*4).to.eql(jsonData.person.u_salary_1_5_year);
});
```

4. Достать значение из поля u_salary_1_5_year и передать в поле salary запроса `http://162.55.220.72:5005/get_test_user`
```js
let salaryInt = jsonData.person.u_salary_1_5_year;
pm.environment.set("salary", jsonData.person.u_salary_1_5_year);
```

<hr>

### 3. `http://162.55.220.72:5005/new_data`
+ Request
```
POST
age: int
salary: int
name: str
auth_token
```

+ Response
```json
{
    "name":"name",
    "age": "int(age)",
    "salary": [
                "salary", 
                "str(salary*2)", 
                "str(salary*3)"
            ]
}
```
+ Тесты:
1. Статус код 200
```js
pm.test("Статус код 200", function () {
    pm.response.to.have.status(200);
});
```
2. Проверка структуры json в ответе.
```js
let schema = {
    "properties": {
    "age": {
      "type": "integer"
    },
    "name": {
      "type": "string"
    },
    "salary": {
      "type": "array",
      "items": [
        {
          "type": "integer"
        },
        {
          "type": "string"
        },
        {
          "type": "string"
        }
      ]
    }
  }
}

let jsonData = pm.response.json();
pm.test("Validate JSON schema", function() {
  var valid = tv4.validate(jsonData, schema, false, true);
  if (valid !== true) {
      console.log(tv4.error);
  }
  pm.expect(valid).to.be.true;
});

```
3. В ответе указаны коэффициенты умножения salary, напишите тесты по проверке правильности результата перемножения на коэффициент.

```js
let salary_0 = jsonData.salary[0];
let salary_1 = jsonData.salary[1];
let salary_2 = jsonData.salary[2];
let reqData = request.data;

pm.test("request salary*1 = response salary[0]", function () {
    pm.expect(reqData.salary*1).to.eql(salary_0);
});
pm.test("request salary*2 = response salary[1]", function () {
    pm.expect(reqData.salary*2).to.eql(+salary_1);
});
pm.test("request salary*3 = response salary[2]", function () {
    pm.expect(reqData.salary*3).to.eql(+salary_2);
});
```

4. проверить, что 2-й элемент массива salary больше 1-го и 0-го
```js
pm.test("response salary[2] > response salary[1] and > response salary[0]", function () {
    pm.expect(+salary_2).to.above(+salary_1);
    pm.expect(+salary_2).to.above(salary_0);
});
```

<hr>

### 4. `http://162.55.220.72:5005/test_pet_info`
+ Request
```
POST
age: int
weight: int
name: str
auth_token
```

+ Response
```json
{
    "name":"name",
    "age":"age",
    "daily_food":"weight * 0.012",
    "daily_sleep":"weight * 2.5"
}
```

+ Тесты:
1. Статус код 200

```js
pm.test("Статус код 200", function () {
    pm.response.to.have.status(200);
});
```

2. Проверка структуры json в ответе.

```js
let schema = {
    "properties": {
    "age": {
      "type": "integer"
    },
    "daily_food": {
      "type": "number"
    },
    "daily_sleep": {
      "type": "number"
    },
    "name": {
      "type": "string"
    }
  }
}

let jsonData = pm.response.json();
pm.test("Validate JSON schema", function() {
  var valid = tv4.validate(jsonData, schema, false, true);
  if (valid !== true) {
      console.log(tv4.error);
  }
  pm.expect(valid).to.be.true;
});
```

3. В ответе указаны коэффициенты умножения weight, напишите тесты по проверке правильности результата перемножения на коэффициент.
```js
let reqData = request.data;
let reqWeight = reqData.weight

pm.test("request weight*0.012 = response daily_food", function () {
    pm.expect(reqWeight*0.012).to.eql(jsonData.daily_food);
});

pm.test("request weight*2.5 = response daily_food", function () {
    pm.expect(reqWeight*2.5).to.eql(jsonData.daily_sleep);
});
```

### 5. `http://162.55.220.72:5005/get_test_user`
+ Request
```
POST
age: int
salary: int
name: str
auth_token
```

+ Response
```json
{
    "name":"name",
    "age":"age",
    "salary":"salary",
    "family":{
                "children":[
                    ["Alex", "24"],
                    ["Kate", "12"]
                    ],
    "u_salary_1.5_year": "salary * 4"
    }
}
```

+ Тесты:
1. Статус код 200
```js
pm.test("Статус код 200", function () {
    pm.response.to.have.status(200);
});
```
2. Проверка структуры json в ответе.
```js
let schema = {
    "properties": {
    "age": {
      "type": "string"
    },
    "family": {
      "type": "object",
      "properties": {
        "children": {
          "type": "array",
          "items": [
            {
              "type": "array",
              "items": [
                {
                  "type": "string"
                },
                {
                  "type": "integer"
                }
              ]
            },
            {
              "type": "array",
              "items": [
                {
                  "type": "string"
                },
                {
                  "type": "integer"
                }
              ]
            }
          ]
        },
        "u_salary_1_5_year": {
          "type": "integer"
        }
      },
      "required": [
        "children",
        "u_salary_1_5_year"
      ]
    },
    "name": {
      "type": "string"
    },
    "salary": {
      "type": "integer"
    }
  }
}

let jsonData = pm.response.json();
pm.test("Validate JSON schema", function() {
  var valid = tv4.validate(jsonData, schema, false, true);
  if (valid !== true) {
      console.log(tv4.error);
  }
  pm.expect(valid).to.be.true;
});
```
3. Проверить что занчение поля name = значению переменной name из окружения
```js
let reqData = request.data;
pm.environment.set("name", jsonData.name);
nameEnv = pm.environment.get("name");
pm.test("Значение поля name = значению переменной name из окружения", function () {
    pm.expect(reqData.name).to.eql(nameEnv);
});
```
4. Проверить что занчение поля age в ответе соответсвует отправленному в запросе значению поля age
```js
pm.test("Значение поля age в ответе соответсвует отправленному в запросе значению поля age", function () {
    pm.expect+(jsonData.age).to.eql+(reqData.age);
});
```

<hr>

### 6. `http://162.55.220.72:5005/currency`
+ Request
```
POST
auth_token
```

+ Response Передаётся список массив объектов.

```json
[
    {
        "Cur_Abbreviation": "str",
        "Cur_ID": "int",
        "Cur_Name": "str"
    }
…
    {
        "Cur_Abbreviation": "str",
        "Cur_ID": "int",
        "Cur_Name": "str"
    }
]
```

+ Тесты:
1. Можете взять любой объект из присланного списка, используйте js random.

```js
let jsonData = pm.response.json()
let randomCur_ID = _.random(jsonData.length)
pm.environment.set("Cur_ID",jsonData[randomCur_ID].Cur_ID);
```
1. В объекте возьмите Cur_ID и передать через окружение в следующий запрос.
```js
pm.environment.set("randomCur_ID", randomCur_ID.Cur_ID);
```

<hr>

### 7. `http://162.55.220.72:5005/curr_byn`
+ Request
```
POST
auth_token
curr_code: int
```

+ Response
```json
{
    "Cur_Abbreviation": "str",
    "Cur_ID": "int",
    "Cur_Name": "str",
    "Cur_OfficialRate": "float",
    "Cur_Scale": "int",
    "Date": "str"
}
```

+ Тесты:
1. Статус код 200
```js
pm.test("Статус код 200", function () {
    pm.response.to.have.status(200);
});
```
2. Проверка структуры json в ответе.
```js
let schema = {
    "properties": {
    "Cur_Abbreviation": {
      "type": "string"
    },
    "Cur_ID": {
      "type": "integer"
    },
    "Cur_Name": {
      "type": "string"
    },
    "Cur_OfficialRate": {
      "type": "number"
    },
    "Cur_Scale": {
      "type": "integer"
    },
    "Date": {
      "type": "string"
    }
  }
}

let jsonData = pm.response.json();
pm.test("Validate JSON schema", function() {
  var valid = tv4.validate(jsonData, schema, false, true);
  if (valid !== true) {
      console.log(tv4.error);
  }
  pm.expect(valid).to.be.true;
});
```


<hr>

### 7. `http://162.55.220.72:5005/currency`***

1. получить список валют
2. итерировать список валют
3. в каждой итерации отправлять запрос на сервер для получения курса каждой валюты
4. если возвращается 500 код, переходим к следующей итреации
5. если получаем 200 код, проверяем response json на наличие поля "Cur_OfficialRate"
6. если поле есть, пишем в консоль инфу про фалюту в виде response
```json
{
    "Cur_Abbreviation": "str",
    "Cur_ID": "int",
    "Cur_Name": "str",
    "Cur_OfficialRate": "float",
    "Cur_Scale": "int",
    "Date": "str"
}
```
7. переходим к следующей итерации

```js
let jsonData = pm.response.json()
let jsonDataLength = jsonData.length
let token = pm.environment.get("token")
for(let i = 0; i < jsonDataLength; i++){
    let CurID = jsonData[i].Cur_ID;
    const Method = {
        'method': 'POST',
        'url': 'http://162.55.220.72:5005/curr_byn',
        'body': {
            'mode': 'formdata',
            'formdata': [
                {'key': 'auth_token', 'value': token},
                {'key': 'curr_code', 'value': CurID}
            ]
        }
    };
    pm.sendRequest(Method, (error, response) => {
        if(response.code == 200){
            var jsonData = response.json();
            if(pm.expect(jsonData).to.have.any.keys("Cur_OfficialRate")){
                console.log(jsonData)
            };
        }
    });
}
```
