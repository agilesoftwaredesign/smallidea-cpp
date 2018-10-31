#include "fitnesse/cppslim/Fixture.h"
#include "fitnesse/cppslim/Registry.h"
#include "smallidea/Foo.h"

SLIM_DEFINE_FIXTURE(VerifyFooHiIsOperatingAsExpected) {
    static void RegisterMethods() {
        RegisterCtor0();
        RegisterMethod("hi", &VerifyFooHiIsOperatingAsExpected::GetResult);
    }

    VerifyFooHiIsOperatingAsExpected() : result_{} {}

private:
    std::string result_;
    const Foo unit_{};

    void execute() override {
        result_ = unit_.hi();
    }

    std::string GetResult() const {
        return result_;
    }
};

SLIM_DEFINE_FIXTURE(VerifyFooMagicNumberCalculationIsOperatingAsExpected) {
    static void RegisterMethods() {
        RegisterCtor0();
        RegisterMember("a", &VerifyFooMagicNumberCalculationIsOperatingAsExpected::a_);
        RegisterMember("b", &VerifyFooMagicNumberCalculationIsOperatingAsExpected::b_);
        RegisterMethod("magicNumber", &VerifyFooMagicNumberCalculationIsOperatingAsExpected::GetResult);
    }

    VerifyFooMagicNumberCalculationIsOperatingAsExpected() : a_{}, b_{}, magic_number_{} {}

private:
    int a_;
    int b_;
    int magic_number_;
    const Foo unit_{};

    void execute() override {
        magic_number_ = unit_.calculateMagicNumberBasedOn(a_, b_);
    }

    int GetResult() const {
        return magic_number_;
    }
};
