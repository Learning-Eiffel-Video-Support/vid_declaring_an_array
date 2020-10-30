note
	description: "Tests of {VID_DECLARING_AN_ARRAY}."
	testing: "type/manual"

							-- Hover and click open!
	EIS: "name=try", "src=https://www.eiffel.com"
	EIS: "name=buy", "src=https://account.eiffel.com/licenses/_/buy/"
			-- Code commercial for less than 41 cents a day!

	EiS: "name=other_demos", "src=https://github.com/Learning-Eiffel-Video-Support"

	EIS: "name=video_demo", "src=https://youtu.be/8zmJBfpOjvc"
	EIS: "name=learning_eiffel_channel", "src=https://www.youtube.com/playlist?list=PLf9JgTngKbj417KYiyb4iv88GYAlhN7FX"

class
	VID_DECLARING_AN_ARRAY_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	array_tests
			-- `array_tests'
		note
			explanation: "[
				Simple and 1-dimensional arrays. The ARRAY [G] class is the
				basis for the notion of "manifest arrays"—that is—arrays typed
				in code as << ... >> (double-angle-brackets). The [G] of the array
				being determined by the contents.
				
				Pros
				- Difficult to grow, which means stable memory allocation after creation.
				
				Cons
				- Not easy to grow. Use ARRAYED_LIST if you will need to dynamically (as-it-is-used)
					grow your array. Otherwise, use ARRAY for stable item counts. Less is okay.
				]"
		local
			l_array: ARRAY [STRING]
			l_array_any: ARRAY [ANY]
		do
			create l_array.make_empty
			create l_array.make_filled ("X", 1, 5)
			create l_array.make_from_array (<<"my", "new", "array">>)
			create l_array.make_from_special (<<"another", "way">>)

				-- Add items to an empty array
			create l_array.make_empty
			l_array.grow (3)
			l_array.put ("a", 1)
			l_array.put ("b", 2)
			l_array.put ("c", 3)
			assert_arrays_equal ("abc", <<"a", "b", "c">>, l_array)

				-- Test filled array
			create l_array.make_filled ("X", 1, 5) -- Create an array filled with five "X" items.
			assert_arrays_equal ("abc", <<"X","X","X","X","X">>, l_array) -- Test that theory.

			l_array_any := <<1, "abc", 'x'>> -- A simple array filled with object of ANY type.
												-- Here, we see <<INTEGER, STRING, CHARACTER>>
		end

	arrayed_list_tests
			-- `arrayed_list_tests'
		note
			explanation: "[
				An ARRAY is not a DYNAMIC_LIST (Sequential, dynamically modifiable lists),
				but an ARRAYED_LISt [G] is. What changes?
				
				Pros
				- Easily expanded and grown using features like `force'.
				
				Cons
				- Easily expandable means potentially slower due to memory allocations.
				]"
		local
			l_array: ARRAYED_LIST [STRING]
		do
			create l_array.make (0) -- empty array (like make_empty above)
			create l_array.make_filled (3) -- 3 null strings
			assert_arrays_equal ("three", <<Void,Void,Void>>, l_array.to_array)
			create l_array.make_from_array (<<"a", "b", "c">>)
			assert_arrays_equal ("three", <<"a", "b", "c">>, l_array.to_array)
		end

	arrayed_stack_tests
			-- `arrayed_stack_tests'
		local
			l_array: ARRAYED_STACK [INTEGER]
		do
			create l_array.make (0)
			l_array.force (1)
			l_array.force (2)
			l_array.force (3)
			assert_integers_equal ("three", 3, l_array.count)
		end

	arrayn_tests
			-- Multidimensional `arrayn_tests'
		note
			explanation: "[
				The ARRAYN [G] class is designed to manage multi-dimensional arrays.
				This class can be memory intensive as well as a memory allocation hog.
				This is also not a production-proven class. It was created as an
				experiment and demonstration of "can-it-be-done" in Eiffel. The answer
				is yes, but the bugs, memory issues, and other matters have not been
				properly vetted.
				]"
		local
			l_array: ARRAYN [INTEGER]
		do
			create l_array.make_n_based (<<[1, 3], [1, 3]>>) -- 2-dim array with 3-elements along each dimension
			l_array.put (100, <<2, 2>>) -- put 100 at 2,2 or (x,y)
			assert_integers_equal ("2_2", 100, l_array.item (<<2, 2>>)) -- what value is at x,y or 2,2?
			assert_integers_equal ("2_2_at", 100, l_array @ [2,2]) -- another way to ask the same thing.

			create l_array.make_n_based (<<[1, 4], [1, 100], [1, 10]>>) -- 3D array w/4x100x10 elem's
			l_array.put (1_999, <<3, 40, 4>>) -- put 1,999 at [3,40,4]
			assert_integers_equal ("2_40_4_at", 1_999, l_array @ [3, 40, 4]) -- see if we can get it back.

			create l_array.make_one_based (<<1,2,3,4>>)
			create l_array.make_one_based_filled (<<1,2,3,4>>, 0)
		end

end
