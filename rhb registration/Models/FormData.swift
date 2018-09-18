//
//  FormData.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 28/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

class FormData: NSObject, NSCoding {
    var img_ektp_url: String = ""
    var img_npwp_url: String = ""
    var img_selfie_ektp_url: String = ""
    var video_url: String = ""
    var full_signature_url: String = ""
    var initial_signature_url: String = ""
    
    var nama_lengkap: String = ""
    var nomor_identitas: String = ""
    var kenal_dari: String = "Lainnya"
    var kenal_cabang: String = ""
    var negara_lahir: String = ""
    var tempat_lahir: String = ""
    var tgl_lahir: String = ""
    var no_hp: String = ""
    var no_passport: String = ""
    var no_telp_rumah: String = ""
    var email: String = ""
    var citizenship: String = "INDONESIAN"
    var citizenship_str: String = ""
    var tipe_identitas: String = ""
    var nomor_kitas: String = ""
    var have_green_card: String = ""
    var no_npwp: String = ""
    var alasan_non_npwp: String = ""
    var alamat_identitas: String = ""
    var rt_identitas: String = ""
    var rw_identitas: String = ""
    
    var provinsi_identitas: String = ""
    var kelurahan_identitas: String = ""
    var kecamatan_identitas: String = ""
    var kabupaten_identitas: String = ""
    var negara_identitas: String = ""
    var kodepos_identitas: String = ""
    var alamat_tempat_tinggal: String = ""
    var provinsi_tempat_tinggal: String = ""
    var rt_tempat_tinggal: String = ""
    var rw_tempat_tinggal: String = ""
    var kelurahan_tempat_tinggal: String = ""
    var kecamatan_tempat_tinggal: String = ""
    var kabupaten_tempat_tinggal: String = ""
    var negara_tempat_tinggal: String = ""
    
    var kepemilikan_rmh: String = ""
    var kepemilikan_rmh_string: String = ""
    
    var jenis_kelamin: String = ""
    var jenis_kelamin_string: String = ""
    
    var agama: String = ""
    var agama_string: String = ""
    
    var pendidikan: String = ""
    var pendidikan_string: String = ""
    
    var status_perkawinan: String = ""
    var status_perkawinan_string: String = ""
    
    var nama_gadis_ibu: String = ""
    
    var tujuan_investasi: String = ""
    var tujuan_investasi_string: String = ""
    
    var nama_bank: String = ""
    var cabang_bank: String = ""
    var negara_bank: String = ""
    var kab_bank: String = ""
    var nama_rekening: String = ""
    var nomor_rekening: String = ""
    var bank_rdi: String = ""
    
    var kode_bank: String = ""
    var currency_rdi: String = ""
    
    var pekerjaan: String = ""
    var pekerjaan_lainnya: String = ""
    var pekerjaan_string: String = ""
    
    var nama_instansi: String = ""
    
    var bidang_usaha: String = ""
    var bidang_usaha_lain: String = ""
    var bidang_usaha_string: String = ""
    
    var jabatan: String = ""
    var alamat_instansi: String = ""
    var negara_instansi: String = ""
    var kab_instansi: String = ""
    
    var telp_instansi: String = ""
    var fax_instansi: String = ""
    
    var sumber_dana: String = ""
    var sumber_dana_string: String = ""
    
    var sumber_penghasilan: String = ""
    var rata_penghasilan: String = ""
    var rata_pengeluaran: String = ""
    var spouse_parents_name: String = ""
    var spouse_parents_occupation: String = ""
    
    var spouse_parents_company: String = ""
    var emergency_contact_name: String = ""
    var emergency_contact_phone: String = ""
    var emergency_contact_relationship: String = ""
    var limit_perdagangan: String = ""
    var komisi_buy: String = ""
    var komisi_sell: String = ""
    var ins_pembyran: String = ""
    var status: String = ""
    var terminal: String = "IOS"
    
    override init() {

    }
    
    // MARK: - NSCoding
    required init(coder aDecoder: NSCoder) {
        img_ektp_url = aDecoder.decodeObject(forKey: "img_ektp_url") as! String
        img_npwp_url = aDecoder.decodeObject(forKey: "img_npwp_url") as! String
        img_selfie_ektp_url = aDecoder.decodeObject(forKey: "img_selfie_ektp_url") as! String
        video_url = aDecoder.decodeObject(forKey: "video_url") as! String
        full_signature_url = aDecoder.decodeObject(forKey: "full_signature_url") as! String
        initial_signature_url = aDecoder.decodeObject(forKey: "initial_signature_url") as! String

        nama_lengkap = aDecoder.decodeObject(forKey: "nama_lengkap") as! String
        nomor_identitas = aDecoder.decodeObject(forKey: "nomor_identitas") as! String
        kenal_dari = aDecoder.decodeObject(forKey: "kenal_dari") as! String
        kenal_cabang = aDecoder.decodeObject(forKey: "kenal_cabang") as! String
        negara_lahir = aDecoder.decodeObject(forKey: "negara_lahir") as! String
        tempat_lahir = aDecoder.decodeObject(forKey: "tempat_lahir") as! String
        tgl_lahir = aDecoder.decodeObject(forKey: "tgl_lahir") as! String
        no_hp = aDecoder.decodeObject(forKey: "no_hp") as! String
        no_passport = aDecoder.decodeObject(forKey: "no_passport") as! String
        no_telp_rumah = aDecoder.decodeObject(forKey: "no_telp_rumah") as! String
        email = aDecoder.decodeObject(forKey: "email") as! String
        citizenship = aDecoder.decodeObject(forKey: "citizenship") as! String
        citizenship_str = aDecoder.decodeObject(forKey: "citizenship_str") as! String
        tipe_identitas = aDecoder.decodeObject(forKey: "tipe_identitas") as! String
        nomor_kitas = aDecoder.decodeObject(forKey: "nomor_kitas") as! String
        have_green_card = aDecoder.decodeObject(forKey: "have_green_card") as! String
        no_npwp = aDecoder.decodeObject(forKey: "no_npwp") as! String
        alasan_non_npwp = aDecoder.decodeObject(forKey: "alasan_non_npwp") as! String
        alamat_identitas = aDecoder.decodeObject(forKey: "alamat_identitas") as! String
        rt_identitas = aDecoder.decodeObject(forKey: "rt_identitas") as! String
        rw_identitas = aDecoder.decodeObject(forKey: "rw_identitas") as! String
        provinsi_identitas = aDecoder.decodeObject(forKey: "provinsi_identitas") as! String
        kelurahan_identitas = aDecoder.decodeObject(forKey: "kelurahan_identitas") as! String
        kecamatan_identitas = aDecoder.decodeObject(forKey: "kecamatan_identitas") as! String
        kabupaten_identitas = aDecoder.decodeObject(forKey: "kabupaten_identitas") as! String
        negara_identitas = aDecoder.decodeObject(forKey: "negara_identitas") as! String
        kodepos_identitas = aDecoder.decodeObject(forKey: "kodepos_identitas") as! String
        alamat_tempat_tinggal = aDecoder.decodeObject(forKey: "alamat_tempat_tinggal") as! String
        provinsi_tempat_tinggal = aDecoder.decodeObject(forKey: "provinsi_tempat_tinggal") as! String
        rt_tempat_tinggal = aDecoder.decodeObject(forKey: "rt_tempat_tinggal") as! String
        rw_tempat_tinggal = aDecoder.decodeObject(forKey: "rw_tempat_tinggal") as! String
        kelurahan_tempat_tinggal = aDecoder.decodeObject(forKey: "kelurahan_tempat_tinggal") as! String
        kecamatan_tempat_tinggal = aDecoder.decodeObject(forKey: "kecamatan_tempat_tinggal") as! String
        kabupaten_tempat_tinggal = aDecoder.decodeObject(forKey: "kabupaten_tempat_tinggal") as! String
        negara_tempat_tinggal = aDecoder.decodeObject(forKey: "negara_tempat_tinggal") as! String
        
        kepemilikan_rmh = aDecoder.decodeObject(forKey: "kepemilikan_rmh") as! String
        kepemilikan_rmh_string = aDecoder.decodeObject(forKey: "kepemilikan_rmh_string") as! String
        
        jenis_kelamin = aDecoder.decodeObject(forKey: "jenis_kelamin") as! String
        jenis_kelamin_string = aDecoder.decodeObject(forKey: "jenis_kelamin_string") as! String
        
        agama = aDecoder.decodeObject(forKey: "agama") as! String
        agama_string = aDecoder.decodeObject(forKey: "agama_string") as! String
        
        pendidikan = aDecoder.decodeObject(forKey: "pendidikan") as! String
        pendidikan_string = aDecoder.decodeObject(forKey: "pendidikan_string") as! String
        
        status_perkawinan = aDecoder.decodeObject(forKey: "status_perkawinan") as! String
        status_perkawinan_string = aDecoder.decodeObject(forKey: "status_perkawinan_string") as! String
        
        nama_gadis_ibu = aDecoder.decodeObject(forKey: "nama_gadis_ibu") as! String
        
        tujuan_investasi = aDecoder.decodeObject(forKey: "tujuan_investasi") as! String
        tujuan_investasi_string = aDecoder.decodeObject(forKey: "tujuan_investasi_string") as! String
        
        nama_bank = aDecoder.decodeObject(forKey: "nama_bank") as! String
        cabang_bank = aDecoder.decodeObject(forKey: "cabang_bank") as! String
        negara_bank = aDecoder.decodeObject(forKey: "negara_bank") as! String
        kab_bank = aDecoder.decodeObject(forKey: "kab_bank") as! String
        nama_rekening = aDecoder.decodeObject(forKey: "nama_rekening") as! String
        nomor_rekening = aDecoder.decodeObject(forKey: "nomor_rekening") as! String
        bank_rdi = aDecoder.decodeObject(forKey: "bank_rdi") as! String
        kode_bank = aDecoder.decodeObject(forKey: "kode_bank") as! String
        currency_rdi = aDecoder.decodeObject(forKey: "currency_rdi") as! String
        
        pekerjaan = aDecoder.decodeObject(forKey: "pekerjaan") as! String
        pekerjaan_lainnya = aDecoder.decodeObject(forKey: "pekerjaan_lainnya") as! String
        pekerjaan_string = aDecoder.decodeObject(forKey: "pekerjaan_string") as! String
        
        nama_instansi = aDecoder.decodeObject(forKey: "nama_instansi") as! String
        
        bidang_usaha = aDecoder.decodeObject(forKey: "bidang_usaha") as! String
        bidang_usaha_lain = aDecoder.decodeObject(forKey: "bidang_usaha_lain") as! String
        bidang_usaha_string = aDecoder.decodeObject(forKey: "bidang_usaha_string") as! String
        
        jabatan = aDecoder.decodeObject(forKey: "jabatan") as! String
        alamat_instansi = aDecoder.decodeObject(forKey: "alamat_instansi") as! String
        negara_instansi = aDecoder.decodeObject(forKey: "negara_instansi") as! String
        kab_instansi = aDecoder.decodeObject(forKey: "kab_instansi") as! String
        telp_instansi = aDecoder.decodeObject(forKey: "telp_instansi") as! String
        fax_instansi = aDecoder.decodeObject(forKey: "fax_instansi") as! String
        
        sumber_dana = aDecoder.decodeObject(forKey: "sumber_dana") as! String
        sumber_dana_string = aDecoder.decodeObject(forKey: "sumber_dana_string") as! String
        
        sumber_penghasilan = aDecoder.decodeObject(forKey: "sumber_penghasilan") as! String
        rata_penghasilan = aDecoder.decodeObject(forKey: "rata_penghasilan") as! String
        rata_pengeluaran = aDecoder.decodeObject(forKey: "rata_pengeluaran") as! String
        spouse_parents_name = aDecoder.decodeObject(forKey: "spouse_parents_name") as! String
        spouse_parents_occupation = aDecoder.decodeObject(forKey: "spouse_parents_occupation") as! String
        spouse_parents_company = aDecoder.decodeObject(forKey: "spouse_parents_company") as! String
        emergency_contact_name = aDecoder.decodeObject(forKey: "emergency_contact_name") as! String
        emergency_contact_phone = aDecoder.decodeObject(forKey: "emergency_contact_phone") as! String
        emergency_contact_relationship = aDecoder.decodeObject(forKey: "emergency_contact_relationship") as! String
        limit_perdagangan = aDecoder.decodeObject(forKey: "limit_perdagangan") as! String
        komisi_buy = aDecoder.decodeObject(forKey: "komisi_buy") as! String
        komisi_sell = aDecoder.decodeObject(forKey: "komisi_sell") as! String
        ins_pembyran = aDecoder.decodeObject(forKey: "ins_pembyran") as! String
        status = aDecoder.decodeObject(forKey: "status") as! String
        terminal = aDecoder.decodeObject(forKey: "terminal") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(img_ektp_url, forKey: "img_ektp_url")
        aCoder.encode(img_npwp_url, forKey: "img_npwp_url")
        aCoder.encode(img_selfie_ektp_url, forKey: "img_selfie_ektp_url")
        aCoder.encode(video_url, forKey: "video_url")
        aCoder.encode(full_signature_url, forKey: "full_signature_url")
        aCoder.encode(initial_signature_url, forKey: "initial_signature_url")
        
        aCoder.encode(nama_lengkap, forKey: "nama_lengkap")
        aCoder.encode(nomor_identitas, forKey: "nomor_identitas")
        aCoder.encode(kenal_dari, forKey: "kenal_dari")
        aCoder.encode(kenal_cabang, forKey: "kenal_cabang")
        aCoder.encode(negara_lahir, forKey: "negara_lahir")
        aCoder.encode(tempat_lahir, forKey: "tempat_lahir")
        aCoder.encode(tgl_lahir, forKey: "tgl_lahir")
        aCoder.encode(no_hp, forKey: "no_hp")
        aCoder.encode(no_passport, forKey: "no_passport")
        aCoder.encode(no_telp_rumah, forKey: "no_telp_rumah")
        aCoder.encode(email, forKey: "email")
        
        aCoder.encode(citizenship, forKey: "citizenship")
        aCoder.encode(citizenship_str, forKey: "citizenship_str")
        aCoder.encode(tipe_identitas, forKey: "tipe_identitas")
        aCoder.encode(nomor_kitas, forKey: "nomor_kitas")
        aCoder.encode(have_green_card, forKey: "have_green_card")
        aCoder.encode(no_npwp, forKey: "no_npwp")
        aCoder.encode(alasan_non_npwp, forKey: "alasan_non_npwp")
        aCoder.encode(alamat_identitas, forKey: "alamat_identitas")
        aCoder.encode(rt_identitas, forKey: "rt_identitas")
        aCoder.encode(rw_identitas, forKey: "rw_identitas")
        
        aCoder.encode(provinsi_identitas, forKey: "provinsi_identitas")
        aCoder.encode(kelurahan_identitas, forKey: "kelurahan_identitas")
        aCoder.encode(kecamatan_identitas, forKey: "kecamatan_identitas")
        aCoder.encode(kabupaten_identitas, forKey: "kabupaten_identitas")
        aCoder.encode(negara_identitas, forKey: "negara_identitas")
        aCoder.encode(kodepos_identitas, forKey: "kodepos_identitas")
        aCoder.encode(alamat_tempat_tinggal, forKey: "alamat_tempat_tinggal")
        aCoder.encode(provinsi_tempat_tinggal, forKey: "provinsi_tempat_tinggal")
        aCoder.encode(rt_tempat_tinggal, forKey: "rt_tempat_tinggal")
        aCoder.encode(rw_tempat_tinggal, forKey: "rw_tempat_tinggal")
        aCoder.encode(kelurahan_tempat_tinggal, forKey: "kelurahan_tempat_tinggal")
        aCoder.encode(kecamatan_tempat_tinggal, forKey: "kecamatan_tempat_tinggal")
        aCoder.encode(kabupaten_tempat_tinggal, forKey: "kabupaten_tempat_tinggal")
        aCoder.encode(negara_tempat_tinggal, forKey: "negara_tempat_tinggal")
        
        aCoder.encode(kepemilikan_rmh, forKey: "kepemilikan_rmh")
        aCoder.encode(kepemilikan_rmh_string, forKey: "kepemilikan_rmh_string")
        
        aCoder.encode(jenis_kelamin, forKey: "jenis_kelamin")
        aCoder.encode(jenis_kelamin_string, forKey: "jenis_kelamin_string")
        
        aCoder.encode(agama, forKey: "agama")
        aCoder.encode(agama, forKey: "agama_string")
        
        aCoder.encode(pendidikan, forKey: "pendidikan")
        aCoder.encode(pendidikan_string, forKey: "pendidikan_string")
        
        aCoder.encode(status_perkawinan, forKey: "status_perkawinan")
        aCoder.encode(status_perkawinan_string, forKey: "status_perkawinan_string")
        
        aCoder.encode(nama_gadis_ibu, forKey: "nama_gadis_ibu")
        
        aCoder.encode(tujuan_investasi, forKey: "tujuan_investasi")
        aCoder.encode(tujuan_investasi_string, forKey: "tujuan_investasi_string")
        
        aCoder.encode(nama_bank, forKey: "nama_bank")
        aCoder.encode(cabang_bank, forKey: "cabang_bank")
        aCoder.encode(negara_bank, forKey: "negara_bank")
        aCoder.encode(kab_bank, forKey: "kab_bank")
        aCoder.encode(nama_rekening, forKey: "nama_rekening")
        aCoder.encode(nomor_rekening, forKey: "nomor_rekening")
        aCoder.encode(bank_rdi, forKey: "bank_rdi")
        
        aCoder.encode(kode_bank, forKey: "kode_bank")
        
        aCoder.encode(currency_rdi, forKey: "currency_rdi")
        
        aCoder.encode(pekerjaan, forKey: "pekerjaan")
        aCoder.encode(pekerjaan_lainnya, forKey: "pekerjaan_lainnya")
        aCoder.encode(pekerjaan_string, forKey: "pekerjaan_string")
        
        aCoder.encode(nama_instansi, forKey: "nama_instansi")
        
        aCoder.encode(bidang_usaha, forKey: "bidang_usaha")
        aCoder.encode(bidang_usaha_lain, forKey: "bidang_usaha_lain")
        aCoder.encode(bidang_usaha_string, forKey: "bidang_usaha_string")
        
        aCoder.encode(jabatan, forKey: "jabatan")
        aCoder.encode(alamat_instansi, forKey: "alamat_instansi")
        aCoder.encode(negara_instansi, forKey: "negara_instansi")
        aCoder.encode(kab_instansi, forKey: "kab_instansi")
        
        aCoder.encode(telp_instansi, forKey: "telp_instansi")
        aCoder.encode(fax_instansi, forKey: "fax_instansi")
        
        aCoder.encode(sumber_dana, forKey: "sumber_dana")
        aCoder.encode(sumber_dana_string, forKey: "sumber_dana_string")
        
        aCoder.encode(sumber_penghasilan, forKey: "sumber_penghasilan")
        aCoder.encode(rata_penghasilan, forKey: "rata_penghasilan")
        aCoder.encode(rata_pengeluaran, forKey: "rata_pengeluaran")
        aCoder.encode(spouse_parents_name, forKey: "spouse_parents_name")
        aCoder.encode(spouse_parents_occupation, forKey: "spouse_parents_occupation")
        
        aCoder.encode(spouse_parents_company, forKey: "spouse_parents_company")
        aCoder.encode(emergency_contact_name, forKey: "emergency_contact_name")
        aCoder.encode(emergency_contact_phone, forKey: "emergency_contact_phone")
        aCoder.encode(emergency_contact_relationship, forKey: "emergency_contact_relationship")
        aCoder.encode(limit_perdagangan, forKey: "limit_perdagangan")
        aCoder.encode(komisi_buy, forKey: "komisi_buy")
        aCoder.encode(komisi_sell, forKey: "komisi_sell")
        aCoder.encode(ins_pembyran, forKey: "ins_pembyran")
        aCoder.encode(status, forKey: "status")
        aCoder.encode(terminal, forKey: "terminal")
    }
    
    func toDictionary() -> Dictionary<String, String> {
        return [
            "nama_lengkap" : self.nama_lengkap,
            "nomor_identitas" : self.nomor_identitas,
            "kenal_dari" : self.kenal_dari,
            "kenal_cabang" : self.kenal_cabang,
            "negara_lahir" : self.negara_lahir,
            "tempat_lahir" : self.tempat_lahir,
            "tgl_lahir" : self.tgl_lahir,
            "no_hp" : self.no_hp,
            "no_passport" : self.no_passport,
            "no_telp_rumah" : self.no_telp_rumah,
            "email" : self.email,
            
            "citizenship" : self.citizenship,
            "citizenship_str" : self.citizenship_str,
            "tipe_identitas" : self.tipe_identitas,
            "nomor_kitas" : self.nomor_kitas,
            "have_green_card" : self.have_green_card,
            "no_npwp" : self.no_npwp,
            "alasan_non_npwp" : self.alasan_non_npwp,
            "alamat_identitas" : self.alamat_identitas,
            "rt_identitas" : self.rt_identitas,
            "rw_identitas" : self.rw_identitas,
            
            "provinsi_identitas" : self.provinsi_identitas,
            "kelurahan_identitas" : self.kelurahan_identitas,
            "kecamatan_identitas" : self.kecamatan_identitas,
            "kabupaten_identitas" : self.kabupaten_identitas,
            "negara_identitas" : self.negara_identitas,
            "kodepos_identitas" : self.kodepos_identitas,
            "alamat_tempat_tinggal" : self.alamat_tempat_tinggal,
            "provinsi_tempat_tinggal" : self.provinsi_tempat_tinggal,
            "rt_tempat_tinggal" : self.rt_tempat_tinggal,
            "rw_tempat_tinggal" : self.rw_tempat_tinggal,
            "kelurahan_tempat_tinggal" : self.kelurahan_tempat_tinggal,
            "kecamatan_tempat_tinggal" : self.kecamatan_tempat_tinggal,
            "kabupaten_tempat_tinggal" : self.kabupaten_tempat_tinggal,
            "negara_tempat_tinggal" : self.negara_tempat_tinggal,
            
            "kepemilikan_rmh" : self.kepemilikan_rmh,
            
            "jenis_kelamin" : self.jenis_kelamin,
            "agama" : self.agama,
            "pendidikan" : self.pendidikan,
            "status_perkawinan" : self.status_perkawinan,
            "nama_gadis_ibu" : self.nama_gadis_ibu,
            "tujuan_investasi" : self.tujuan_investasi,
            "nama_bank" : self.nama_bank,
            "cabang_bank" : self.cabang_bank,
            "negara_bank" : self.negara_bank,
            "kab_bank" : self.kab_bank,
            "nama_rekening" : self.nama_rekening,
            "nomor_rekening" : self.nomor_rekening,
            "bank_rdi" : self.bank_rdi,
            
            "kode_bank" : self.kode_bank,
            "currency_rdi" : self.currency_rdi,
            "pekerjaan" : self.pekerjaan,
            "pekerjaan_lainnya" : self.pekerjaan_lainnya,
            "nama_instansi" : self.nama_instansi,
            
            "bidang_usaha" : self.bidang_usaha,
            "bidang_usaha_lain" : self.bidang_usaha_lain,
            
            
            "jabatan" : self.jabatan,
            "alamat_instansi" : self.alamat_instansi,
            "negara_instansi" : self.negara_instansi,
            "kab_instansi" : self.kab_instansi,
            
            "telp_instansi" : self.telp_instansi,
            "fax_instansi" : self.fax_instansi,
            "sumber_dana" : self.sumber_dana,
            "sumber_penghasilan" : self.sumber_penghasilan,
            "rata_penghasilan" : self.rata_penghasilan,
            "rata_pengeluaran" : self.rata_pengeluaran,
            "spouse_parents_name" : self.spouse_parents_name,
            "spouse_parents_occupation" : self.spouse_parents_occupation,
            "spouse_parents_company" : self.spouse_parents_company,
            
            "emergency_contact_name" : self.emergency_contact_name,
            "emergency_contact_phone" : self.emergency_contact_phone,
            "emergency_contact_relationship" : self.emergency_contact_relationship,
            
            "limit_perdagangan" : self.limit_perdagangan,
            "komisi_buy" : self.komisi_buy,
            "komisi_sell" : self.komisi_sell,
            "ins_pembyran" : self.ins_pembyran,
            "status" : self.status,
            "terminal" : self.terminal
        ]
    }
}
