# C++ 常见语法

本课程实验框架使用C/C++语言，需要了解基本语法特性


??? Tips "关于基本语法"

    我们默认大家已经有了基本的C/C++编程能力，至少在计算机程序设计(CS1001A)要求范围内的语法这里就不再赘述



## 类(class)

C++ 类是面向对象编程的核心概念之一，可以看作是对 C 语言结构体的扩展。类不仅可以包含数据成员（类似于结构体中的字段），还可以包含函数成员（方法），用于操作这些数据。以下是关于 C++ 类的一些基本介绍：

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
