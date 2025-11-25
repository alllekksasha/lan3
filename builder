from abc import ABC, abstractmethod

class Builder(ABC):
    @abstractmethod
    def reset(self):
        pass

    @abstractmethod
    def set_part_a(self, value):
        pass

    @abstractmethod
    def set_part_b(self, value):
        pass

    @abstractmethod
    def get_result(self):
        pass

class Product:
    def __init__(self):
        self.parts = []

    def add(self, part):
        self.parts.append(part)

    def __str__(self):
        return f"Product parts: {', '.join(self.parts)}"

class ConcreteBuilder(Builder):
    def __init__(self):
        self.reset()

    def reset(self):
        self.product = Product()

    def set_part_a(self, value):
        self.product.add(f"Part A: {value}")

    def set_part_b(self, value):
        self.product.add(f"Part B: {value}")

    def get_result(self):
        result = self.product
        self.reset()
        return result

class Director:
    def __init__(self, builder):
        self.builder = builder

    def build_minimal_viable_product(self):
        self.builder.set_part_a("Minimal")

    def build_full_featured_product(self):
        self.builder.set_part_a("Full")
        self.builder.set_part_b("With extras")

