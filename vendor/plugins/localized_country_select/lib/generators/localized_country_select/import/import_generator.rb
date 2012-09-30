require 'generators/localized_country_select/import/parse_helper'
require 'generators/localized_country_select/import/content_helper'

module LocalizedCountrySelect
  module Generators
    class ImportGenerator < Rails::Generators::Base
      desc "Import country locale files"

      argument      :locales, :type => :array,  :default => [],       :desc => 'locales to generate for'
      class_option  :file_ext,  :type => :string, :default => 'yml',  :desc => 'file extension for locale files to import (yml or rb)'

      source_root File.dirname(__FILE__)

      def main_flow
        raise ArgumentError, "File extension must be yml or rb" if ![:rb, :yml, :yaml].include?(file_ext.to_sym)
        check_hpricot
        import_for_locales
      end

      protected

      include Import::ParseHelper
      include Import::ContentHelper

      attr_accessor :countries, :locale, :doc

      def file_ext        
        options[:file_ext]
      end

      def import_for_locales
        # Check lang variable
        locales.each do |locale|
          @locale = locale
          import_locale
        end
      end
      
      def import_locale
        valid_locale?
        # ----- Get the CLDR HTML     --------------------------------------------------
        begin
          puts "... getting the HTML file for locale '#{locale}'"
          @doc = Hpricot( open("http://www.unicode.org/cldr/data/charts/summary/#{locale}.html") )
        rescue => e
          puts "[!] Invalid locale name '#{locale}'! Not found in CLDR (#{e})"
          exit 0
        end
        parse_html_file
      end

      def parse_html_file
        # ----- Parse the HTML with Hpricot     ----------------------------------------
        puts "... parsing the HTML file"
        @countries = [] # reset countries list
        doc.search("//tr").each do |row|
          next if !country_row? row
          countries << { :code => get_code(row).to_sym, :name => get_name(row).to_s }
        end
        write_locale_file
      end

      def write_locale_file
        # ----- Write the parsed values into file   ---------------------------------
        puts "\n... writing the output"

        filename = File.join(Rails.root, 'config', 'locales', "countries.#{locale}.#{file_ext}")
        filename += '.NEW' if File.exists?(filename) # Append 'NEW' if file exists
        File.open(filename, 'w+') { |f| f << get_output }

        puts "\n---\nWritten values for the '#{locale}' into file: #{filename}\n"        
      end 

      private
      
      def valid_locale?
        if (/\A[a-z]{2}\z/).match(locale) == nil
          puts "\n[!] Usage: rails g localized_country_select:import de ru --file-ext yml\n\n"
          exit 0
        end
      end

      def check_hpricot
        begin
          require 'hpricot'
        rescue LoadError
          puts "Error: Hpricot library required to use this task (localized_country_select:import)"
          exit
        end
      end           
    end
  end
end