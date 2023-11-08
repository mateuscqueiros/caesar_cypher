require 'spec_helper'
require_relative '../script'

RSpec.describe 'Caesar Cypher' do
  describe 'common' do
    it 'turns aaa into ggg' do
        expect(caesar_cypher("aaa", 6)).to eq("ggg")
    end

    it 'turns computer into jvtwcbly' do
        expect(caesar_cypher("computer", 7)).to eq("jvtwbaly")
    end

    it 'turns dog into rcu' do
        expect(caesar_cypher("dog", 14)).to eq("rcu")
    end
    
  end

  describe 'negative key' do
    it 'turns aaa into zzz' do
        expect(caesar_cypher("aaa", -1)).to eq("zzz")
    end

    it 'turns bbb into xxx' do
        expect(caesar_cypher("bbb", -4)).to eq("xxx")
    end

    it 'turns zzz into yyy' do
        expect(caesar_cypher("zzz", -1)).to eq("yyy")
    end

    it 'turns yyy into xxx' do
        expect(caesar_cypher("yyy", -12)).to eq("mmm")
    end
  end

  describe 'Edge cases' do
    default_message = "The quick brown fox"

    it 'Key of 138' do
        expect(caesar_cypher(default_message, 138)).to eq("Bpm ycqks jzwev nwf")
    end

    it 'Key of 25' do
        expect(caesar_cypher(default_message, 25)).to eq("Sgd pthbj aqnvm enw")
    end

    it 'Key of 26' do
        expect(caesar_cypher(default_message, 26)).to eq(default_message)
    end

    it 'Key of 27' do
        expect(caesar_cypher(default_message, 27)).to eq("Uif rvjdl cspxo gpy")
    end
    
    it 'Key of 0' do
        expect(caesar_cypher(default_message, 0)).to eq(default_message)
    end

    it 'Key of -25' do
        expect(caesar_cypher(default_message, -25)).to eq("Uif rvjdl cspxo gpy")
    end

    it 'Key of -26' do
        expect(caesar_cypher(default_message, -26)).to eq(default_message)
    end

    it 'Key of -27' do
        expect(caesar_cypher(default_message, -27)).to eq("Sgd pthbj aqnvm enw")
    end

    it 'Key of -1000' do
        expect(caesar_cypher(default_message, -1000)).to eq("Hvs eiwqy pfckb tcl")
    end

  end

  describe 'characters not in A-Z range' do
    it 'input of special characters is the same as the output' do
        expect(caesar_cypher(". ,--+==)##$$", 1)).to eq(". ,--+==)##$$")
    end

    it 'turns #04friends into #04Gsjfoet' do
        expect(caesar_cypher("#04Friends", 1)).to eq("#04Gsjfoet")
    end
  end

  describe 'lower/uppercase' do
    it 'turns AAA into BBB' do
        expect(caesar_cypher("AAA", 1)).to eq("BBB")
    end

    it 'turns CaTs ArE CoOl into CaTs ArE CoOl' do
        expect(caesar_cypher("CaTs ArE CoOl", 0)).to eq("CaTs ArE CoOl")
    end

    it 'turns DoGs ArE AwEsOmE into PaSe MdQ MiQeAyQ' do
        expect(caesar_cypher("DoGs ArE AwEsOmE", 12)).to eq("PaSe MdQ MiQeAyQ")
    end
  end

  describe 'messages' do
    it 'encodes message #1' do
        expect(caesar_cypher("If he had anything confidential to say,", 7)).to eq("Pm ol ohk hufaopun jvumpkluaphs av zhf,")
    end

    it 'encodes message' do
        expect(caesar_cypher("The quick brown fox jumps over the lazy dog.", 10)).to eq("Dro aesmu lbygx pyh tewzc yfob dro vkji nyq.")
    end
  end
end
