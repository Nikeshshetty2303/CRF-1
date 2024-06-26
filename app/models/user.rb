class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :set_default_parameters

has_one_attached :file
has_many :xrds,  :dependent => :destroy
has_many :hr_fesem_cs
has_many :hr_fesem_js
has_many :icp_ms
has_many :advance_molecular_rheometers
has_many :ion_chromotography
has_many :tribometers
has_many :glows
has_many :ball_mailings
has_many :multi_impact_testers
has_many :frictions
has_many :gaits
has_many :hrlcms
has_many :grindings
has_many :low_fatigues
has_many:three_d_non_contacts
has_many:raman_microscope
has_many:uv_vis_nir
has_many:tga_fttr
has_many:atomic_force_microscope
has_many:cell_imaging
has_many:spectro_radio_meter
has_many:spark_o
has_many:five_axi
has_many:electro_chemical
has_many:liquid_nitrogen
has_many:gas_sensing
has_many:ultra_centrifuge
has_many:probe_sonicator
has_many:glove_box
has_many:milli_q
has_many:bets
has_many:integrated_multi_role_tester
has_many:scratch_indentations
has_many:three_d_scanner
has_many:impedance_analy
has_many:zeta_potential_size
has_many:high_temp_vaccum
has_many:laser
has_many:micro_edms
has_many:ft_nms
has_many:ansies
has_many :training1s, dependent: :destroy
has_many :training2s, dependent: :destroy
has_many :training3s, dependent: :destroy
has_many :training4s, dependent: :destroy

belongs_to:faculty, optional:true
def set_default_parameters
  if self.role=='student'||self.role=='faculty'
    self.orgname = "NITK" if orgname.blank?
  end
end


protected
def confirmation_required?
    # Disable email confirmation for initial user creation
    !new_record?
  end
end
