# C++ 常见语法

本课程实验框架使用C/C++语言，需要了解基本语法特性。


??? Tips "关于基本语法"

    我们默认大家已经有了基本的C/C++编程能力，至少在计算机程序设计(CS1001A)要求范围内的语法这里就不再赘述。



## 类(class)

C++ 类是面向对象编程的核心概念之一，可以看作是对 C 语言结构体的扩展。类不仅可以包含数据成员（类似于结构体中的字段），还可以包含函数成员（方法），用于操作这些数据。

### 类的定义

类是通过 `class` 关键字定义的。一个简单的类通常包含私有数据和公有方法：

```cpp
class MyClass {
private:
    int data_; // 私有成员变量

public:
    // 构造函数
    MyClass(int data) : data_(data) {}

    // 析构函数
    ~MyClass(){}

    // 公有成员函数
    void display() const {
        printf("Data: %d\n", data_);
    }
};
```

### 访问控制

- **`private`**：私有成员只能被类的成员函数访问。
- **`public`**：公有成员可以在类外部访问。
- **`protected`**：保护成员可以被继承类访问。

### 构造函数和析构函数

- **构造函数**：用于初始化对象。名称与类名相同，无返回类型。
- **析构函数**：用于清理对象。以 `~` 开头，名称与类名相同。

### 成员函数

成员函数可以在类中定义，也可以在类外定义。通常使用 `::` 运算符（作用域解析运算符）在类外定义：



??? Info "作用域解析运算符 `::`"

    作用域解析运算符 `::` 在 C++ 中用于指定某个标识符的作用域。以下是几种常见的用法：

    1. **类的成员函数定义**
   
        用于在类外定义成员函数：

        ```cpp
        class MyClass {
        public:
            void display();
        };

        void MyClass::display() {
            printf("Hello, World!\n");
        }
        ```

    2. **访问类的静态成员**

        用于访问类的静态成员变量或函数，而不需要实例化对象：

        ```cpp
        class MyClass {
        public:
            static int value;
        };

        int MyClass::value = 10;

        int main() {
            printf("%d\n", MyClass::value);
        }
        ```

    3. **命名空间**

        用于访问命名空间中的成员：

        ```cpp
        namespace MyNamespace {
            int value = 20;
        }

        int main() {
            printf("%d\n", MyNamespace::value);
        }
        ```

    4. **全局作用域**

        用于访问全局变量或函数，特别是在局部作用域中存在同名标识符时：

        ```cpp
        int value = 5;

        int main() {
            int value = 10;
            printf("%d\n", ::value); // 输出全局变量 5
        }
        ```

    作用域解析运算符帮助明确标识符的来源，避免命名冲突。

??? Info "初始化成员列表"

    以`MyClass(int data) : data_(data) {}`为例

    - data_(data)：这是成员初始化列表，用于初始化类的数据成员。
    - data_ 是类的成员变量。
    - data_(data) 将参数 data 的值赋给成员变量 data_。

```cpp
void MyClass::display() const {
    printf("Data: %d\n", data_);
}
```

### 继承

C++ 支持继承，一个类可以从另一个类继承。继承类可以重用基类的代码：

```cpp
class Base {
public:
    void show() { printf("Base class\n"); }
};

class Derived : public Base {
    // 继承了 Base 的成员函数和数据
};
```

### 多态

通过将基类的成员函数声明为 `virtual`，可以实现多态，即在运行时决定调用哪个继承类的函数：

??? Info "`override`关键字"

    `override` 关键字在 C++ 中用于明确指定派生类的成员函数是覆盖基类的虚函数。它提高了代码的安全性和可读性。

    **使用方法**

    - 在派生类中定义函数时，在函数签名的末尾加上 `override` 关键字。
    - 确保函数签名与基类中的虚函数完全匹配。

    **示例**

    ```cpp
    class Base {
    public:
        virtual void show() {
            printf("Base class\n");
        }
    };

    class Derived : public Base {
    public:
        void show() override { // 确认覆盖基类的虚函数
            printf("Derived class\n");
        }
    };
    ```

    **作用**

    - **编译时检查**：如果没有正确覆盖基类函数，编译器会报错。
    - **增加可读性**：明确标识函数是重写的。

    使用 `override` 可以有效防止拼写错误或参数不匹配导致的意外行为。

```cpp
class Base {
public:
    virtual void show() { printf("Base class\n"); }
};

class Derived : public Base {
public:
    void show() override { printf("Derived class\n"); }
};
```

### 使用示例

```cpp
int main() {
    MyClass obj(10);
    obj.display();

    Derived derivedObj;
    Base* basePtr = &derivedObj;
    basePtr->show(); // 输出 "Derived class"
}
```

## 容器(Container)

!!! Warning "关于容器"

    C++ 中的容器是标准模板库（STL）的一部分，用于存储和管理数据集合。下面以`std::vector`为例。

`std::vector` 是 C++ 中的动态数组容器，提供灵活的存储和访问功能。

### 特点

- **动态大小**：自动调整大小以适应插入和删除操作。
- **快速随机访问**：支持常数时间复杂度的随机访问。
- **自动内存管理**：自动处理内存分配和释放。

### 常用方法

??? Info "<int\>是什么"

    标准模板库中提供了许多常用数据结构。设想这样一种实际情况，开发者完成了一个高效的stack库(栈)的开发，这个栈中的元素是int类型的，但是还需一个float类型的栈。
    再写一个stack_float库当然是可以的，但是二者之间大部分的逻辑是相同的，我们如何能复用大段的代码来提高开发效率呢？

    一种方法是使用typedef。然而，这种方法有两个缺点：首先，每次修改类型时都需要编辑头文件；其次，在每个程序中只能使用这种技术生成一种类型，即不能让typedef同时代表两种不同的类型，因此不能使用这种方法在一个程序中同时定义float栈和double栈

    在这种情况下，我们可以使用类模版来解决这个问题，我们可以使用stack<int>, stack<float>来分别定义int栈和float栈

    其它的容器同理，如std::vector<int>, std::map<int, std::pair<int, float>>, ...

- **创建和初始化**：
  ```cpp
  std::vector<int> vec;             // 空向量
  std::vector<int> vec(10);         // 大小为 10
  std::vector<int> vec(10, 5);      // 大小为 10，初始化为 5
  std::vector<int> vec = {1, 2, 3}; // 列表初始化
  ```

- **添加元素**：
  ```cpp
  vec.push_back(4); // 在末尾添加元素
  ```

- **删除元素**：
  ```cpp
  vec.pop_back(); // 删除末尾元素
  ```

- **访问元素**：
  ```cpp
  int first = vec.front(); // 获取第一个元素
  int last = vec.back();   // 获取最后一个元素
  int value = vec[2];      // 使用下标访问
  int value = vec.at(2);   // 边界检查访问
  ```

- **迭代器**：
  ```cpp
  for (auto it = vec.begin(); it != vec.end(); ++it) {
      std::cout << *it << " ";
  }

  for (const auto &val : vec) {
      std::cout << val << " ";
  }
  ```

- **容量相关操作**：
  ```cpp
  vec.size();       // 返回元素个数
  vec.capacity();   // 返回分配的存储空间
  vec.empty();      // 检查是否为空
  vec.resize(5);    // 改变大小
  vec.reserve(20);  // 预留空间
  ```

### 注意事项

- **迭代器失效**：插入或删除操作可能导致迭代器失效。
- **效率**：在末尾操作效率高，但中间插入或删除效率较低。

`std::vector` 是处理动态数组的常用选择，适合需要快速访问和自动内存管理的场景。

## for in C++

`for(auto ...)` 语法是 C++11 引入的范围基于 `for` 循环，用于简化遍历容器的代码。

### 基本语法

```cpp
for (auto element : container) {
    // 使用 element
}
```

### 解析

- **`auto`**：自动推断循环变量的类型。
- **`element`**：循环变量，用于访问容器中的每个元素。
- **`container`**：要遍历的容器，如数组、`std::vector`、`std::list` 等。

### 特点

- **简洁性**：无需显式指定迭代器或索引。
- **自动类型推断**：`auto` 自动确定元素类型。
- **适用于所有范围**：任何支持 `begin()` 和 `end()` 的对象。

### 示例

#### 只读遍历

```cpp
std::vector<int> numbers = {1, 2, 3, 4, 5};
for (auto number : numbers) {
    std::cout << number << " ";
}
```

#### 引用遍历（修改元素）

```cpp
for (auto &number : numbers) {
    number *= 2; // 修改容器中的元素
}
```

### 注意

- 使用引用 `&` 可以直接修改容器中的元素。
- 如果不需要修改，直接使用 `auto` 即可。

这种语法使代码更清晰，减少了手动管理迭代器的复杂性。

## static_cast<>()

`static_cast` 是 C++ 中的一种类型转换运算符，用于在不同类型之间进行安全的转换。它在编译时进行类型检查，确保转换的有效性。

### 特点

1. **类型安全**：
   - `static_cast` 在编译时检查类型兼容性，避免运行时错误。

2. **基本类型转换**：
   - 可以用于基本数据类型之间的转换，比如从 `int` 转换为 `float`。

3. **指针和引用转换**：
   - 可以用于类层次结构中的指针或引用转换，如从基类指针转换为派生类指针，前提是类型之间有继承关系。

### 用法示例

```cpp
class Base {
public:
    virtual ~Base() {} // 虚析构函数
};

class Derived : public Base {
public:
    void show() { std::cout << "Derived class" << std::endl; }
};

int main() {
    Base* b = new Derived(); // 基类指针指向派生类对象

    // 使用 static_cast 进行安全转换
    Derived* d = static_cast<Derived*>(b);
    d->show(); // 输出 "Derived class"

    delete b; // 释放内存
    return 0;
}
```

