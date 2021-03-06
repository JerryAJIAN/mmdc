class MpjRegistService < XmlRegistService
  class << self
    
    def save_as_emm(file, video, index)
      save_emm(file, video, index)
    end

    # xmlファイルを解析し、登録する
    def analyze_emm(file, emm)
      f = File.open(file)
      f.seek(36)
      mpj = Zlib::Inflate.inflate(f.read)

      hash2mmd_object(Hash.from_xml(mpj), emm)
    end

  end 
end