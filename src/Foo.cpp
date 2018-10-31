#include "smallidea/Foo.h"

std::string Foo::hi() const noexcept {
    return "hi";
}

int Foo::calculateMagicNumberBasedOn(const int a, const int b) const {
    return a * 2 + b * 3;
}
