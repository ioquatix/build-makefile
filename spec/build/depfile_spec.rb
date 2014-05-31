# Copyright, 2014, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'build/makefile'

module Build::Makefile::DepfileSpec
	DEPFILE_TEXT = <<-EOF
		target1: source1 source2 \
			source3
		
		target2:
		
		target3: \
			source4
	EOF
	
	describe Build::Makefile do
		it "should parse sample depfile" do
			depfile = Build::Makefile.parse(DEPFILE_TEXT)
			
			expect(depfile.rules.count).to be 3
			expect(depfile).to include "target1"
			expect(depfile).to include "target2"
			expect(depfile).to include "target3"
			
			expect(depfile.rules["target1"]).to be == %w{source1 source2 source3}
			expect(depfile.rules["target2"]).to be == %w{}
			expect(depfile.rules["target3"]).to be == %w{source4}
		end
	end
end
