import XCTest
@testable import Cars

class CarsTest : XCTestCase {
  func test_ShouldBuyCar_GivenAHatchback_ShouldReturnFalse() {
    let car = Car()
    car.type = "hatchback"
    
    let carBuyer = CarBuyer()
    let result = carBuyer.shouldBuy(car: car)
    XCTAssertFalse(result)
    
  }
  
  func test_ShouldBuyCar_GivenAPinkCar_ShouldReturnTrue() {
    let car = Car()
    car.color = "Pink"
    
    let carBuyer = CarBuyer()
    let result = carBuyer.shouldBuy(car: car)
    XCTAssertTrue(result)
    
  }
  
  func test_ShouldBuyCar_GivenAPinkCar_AndaHatchback_ShouldReturnFalse() {
    let car = Car();
    car.type = "hatchback"
    car.color = "Pink"
    
    let carBuyer = CarBuyer()
    let result = carBuyer.shouldBuy(car: car)
    XCTAssertFalse(result)
    
  }
  
  func test_ShouldBuyCar_GivenACarBetween6And11Litres_AndEqualOrUnder5000_ShouldReturnTrue() {
    let car = Car()
    car.price = 4900.00
    car.litresPer100km = 10
    
    let carBuyer = CarBuyer()
    let result = carBuyer.shouldBuy(car: car)
    XCTAssertTrue(result);
    
  }
  
  func test_ShouldBuyCar_GivenACarEqualorUnder5000_ShouldReturnTrue() {
    let car = Car()
    car.price = 4990.99
    
    let carBuyer = CarBuyer()
    let result = carBuyer.shouldBuy(car: car)
    XCTAssertTrue(result);
    
  }
  
  func test_ShouldBuyCar_GivenACarOver5000_ShouldReturnFalse() {
    let car = Car();
    car.price = 6000.00
    
    let carBuyer = CarBuyer()
    let result = carBuyer.shouldBuy(car: car)
    XCTAssertFalse(result);
    
  }
}
