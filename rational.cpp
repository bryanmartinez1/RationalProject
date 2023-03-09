#include <iostream>
#include <string>
using namespace std;

class Rational
{
public:
    // numerator
    int m_num;
    // denominator
    int m_den;
    // is rational holder
    string m_rational;

    void setRational(int num1, int num2)
    {
        if (num2 < 0)
        {
            m_num = -1 * num1;
            m_den = -1 * num2;
            is_rational();
            return;
        }
        m_num = num1;
        m_den = num2;
        is_rational();
    }

    bool is_rational()
    {
        if (m_den == 0)
        {
            m_rational = "irrational";
            return false;
        }
        m_rational = "rational";
        return true;
    }

    Rational operator+(Rational const &num)
    {
        Rational ans, temp1, temp2;
        temp1.setRational(m_num, m_den);
        check_error(temp1);
        temp2.setRational(num.m_num, num.m_den);
        check_error(temp2);
        int num1 = m_num * num.m_den + num.m_num * m_den;
        int num2 = m_den * num.m_den;
        ans.setRational(num1, num2);
        check_error(ans);
        temp1.setRational(m_num, m_den);
        temp2.setRational(num.m_num, num.m_den);
        print_operation(temp1, temp2, ans, '+');
        return ans;
    }

    Rational operator-(Rational const &num)
    {
        Rational ans, temp1, temp2;
        int num1 = m_num * num.m_den - num.m_num * m_den;
        int num2 = m_den * num.m_den;
        ans.setRational(num1, num2);
        check_error(ans);
        temp1.setRational(m_num, m_den);
        temp2.setRational(num.m_num, num.m_den);
        print_operation(temp1, temp2, ans, '-');
        return ans;
    }
    Rational operator*(Rational const &num)
    {
        Rational ans, temp1, temp2;
        int num1 = m_num * num.m_num;
        int num2 = m_den * num.m_den;
        ans.setRational(num1, num2);
        check_error(ans);
        temp1.setRational(m_num, m_den);
        temp2.setRational(num.m_num, num.m_den);
        print_operation(temp1, temp2, ans, '*');
        return ans;
    }
    Rational operator/(Rational const &num)
    {
        Rational ans, temp1, temp2;
        int num1 = m_num * num.m_den;
        int num2 = m_den * num.m_num;
        ans.setRational(num1, num2);
        check_error(ans);
        temp1.setRational(m_num, m_den);
        temp2.setRational(num.m_num, num.m_den);
        print_operation(temp1, temp2, ans, '/');
        return ans;
    }
    void print_operation(Rational num1, Rational num2, Rational ans, char operation)
    {
        num1.print_relational();
        cout << operation;
        num2.print_relational();
        cout << "=";
        ans.print_relational();
        cout << endl;
    }

    void print_relational()
    {
        cout << " " << m_rational << " (" << m_num << "/" << m_den << ") ";
    }

    void check_error(Rational temp)
    {
        if (!temp.is_rational())
        {
            throw(temp);
        }
    }
};

int main()
{
    int num1, den1, num2, den2;
    Rational set1, set2, add, sub, mul, div;
    cout << "Input numerator of first number: ";
    cin >> num1;
    cout << "Input denominator of first number: ";
    cin >> den1;
    cout << "Input numerator of second number: ";
    cin >> num2;
    cout << "Input denominator of second number: ";
    cin >> den2;
    set1.setRational(num1, den1);
    set2.setRational(num2, den2);
    set1.print_relational();
    cout << endl;
    set2.print_relational();
    cout << endl;

    try
    {
        add = set1 + set2;
        sub = set1 - set2;
        mul = set1 * set2;
        div = set1 / set2;
    }
    catch (Rational e)
    {
        cout << "ERROR:" << e.m_num << "/" << e.m_den << " is NOT a Rational Number";
    }
    return 0;
}