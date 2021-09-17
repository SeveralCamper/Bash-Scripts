
clean:
	find . -name "*.o" -exec rm '{}' \;
	find . -name "*.d" -exec rm '{}' \;
	find . -name "*.a" -exec rm '{}' \;
	find ./bin -type f -name "BScripts" -exec rm -f '{}' \;
	find ./bin -type f -name "TestBScripts" -exec rm -f '{}' \;

format:
	cd src; find . -name "*.cpp" -exec clang-format -i {} \;
	cd src; find . -name "*.h" -exec clang-format -i {} \;

.PHONY: clean test run all format 
