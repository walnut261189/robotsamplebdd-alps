class CalculatorLibrary:
    def add(self, a, b):
        return float(a) + float(b)

    def subtract(self, a, b):
        return float(a) - float(b)

    def multiply(self, a, b):
        return float(a) * float(b)

    def divide(self, a, b):
        b = float(b)
        if b == 0:
            raise ValueError("Cannot divide by zero")
        return float(a) / b
