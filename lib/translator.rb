# require modules here
require 'yaml'

def load_library(pathway)
  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}
  yaml = YAML.load_file(pathway)
  yaml.each do |meaning, emoticon|
    new_hash["get_meaning"][emoticon[1]]= meaning
    new_hash["get_emoticon"][emoticon[0]]= emoticon[1]
  end
  return new_hash
end

def get_japanese_emoticon(pathway, the_emoticon)
    yaml = load_library(pathway)
    if yaml["get_emoticon"].include?(the_emoticon)
      return yaml["get_emoticon"][the_emoticon]
    end
    return "Sorry, that emoticon was not found"
end

def get_english_meaning(pathway, the_emoticon)
  yaml = load_library(pathway)
  if yaml["get_meaning"].include?(the_emoticon)
    return yaml["get_meaning"][the_emoticon]
  end
  return "Sorry, that emoticon was not found"
end
