import os
import argparse
from datetime import datetime


class InformationFamily:
    def __init__(self, params) -> None:
        self.name: dict = {
            "Oanh": "Le Tu Oanh",
            "Uyen": "Le Tu Uyen",
            "Anh": "Le Tu Anh"
        }
        self.age: dict = {
            "Oanh": 4,
            "Uyen": 1,
            "Anh": 10
        }
        self.address: dict = {
            "Oanh": "Hung Yen",
            "Uyen": "Ha Noi",
            "Anh": "Nam Dinh"
        }
        self.ten = params.ten
        self.tuoi = params.tuoi
        self.diaChi = params.diaChi
        
    def getTen(self) -> str:
        try: return self.name[self.ten]
        except KeyError as e: raise e 
    
    def getTuoi(self) -> int:
        try: return self.age[self.tuoi]
        except KeyError as e: raise e 
        
    def getDiaChi(self) -> str:
        try: return self.address[self.diaChi]
        except KeyError as e: raise e 
    
    
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Get name of Mountant family"
    )
    parser.add_argument("--ten", help="Enter your ten")
    parser.add_argument("--tuoi", help="Enter your tuoi")
    parser.add_argument("--diaChi", help="Enter your diaChi")
    args = parser.parse_args()
    
    family = InformationFamily(args)
    print(family.getTen())
    print(family.getTuoi())
    print(family.getDiaChi())